function Cleaner(outlookObject) {
    
    var OL_FOLDER_INBOX = 6
    var OL_FOLDER_DELETED_ITEMS = 3; 

    var ns = outlookObject.GetNamespace("MAPI")

    var daysAgo = function ( n ) {
        var now = new Date()
        var today = new Date( now.getFullYear(), now.getMonth(), now.getDate(),0,0,0,0);
        return new Date(today.getTime() - (n * 24*60*60*1000) );
    }

    this._Inbox = ns.GetDefaultFolder(OL_FOLDER_INBOX)
    this._DeletedItems = ns.GetDefaultFolder(OL_FOLDER_DELETED_ITEMS)

    this.cleanFolder = function (folderName, ageInDays)  {
        if ( ageInDays < 1 ) 
            throw new Error(-1,"Age must be a positive Number")

        var cutoffDate = daysAgo( ageInDays )
        var folders = [ this._Inbox.Folders(folderName) ]

        while ( folders.length > 0 ) {
            var f = folders.pop()
            WSH.Echo( "*** Processing Folder " + f.Name )
            var deleted = 0
            var total = f.Items.Count
           
            for (var i = total; i > 0; i--) {
                var mi = f.Items(i)
                if ( mi.ReceivedTime < cutoffDate ) {
                    WSH.Echo( " .. Deleting " + mi.ReceivedTime + " : " + mi.Subject )
                    //mi.Delete()
                    mi.Move(this._DeletedItems)
                    deleted = deleted + 1
                }
            }

            WSH.Echo( " >> Deleted (" + deleted + "/" + total + ") items older than " + cutoffDate + " from " + f.Name )

            if ( f.Folders.Count > 0 )  {
                for (var i = 1; i <= f.Folders.Count; i++) {
                    folders.push( f.Folders.Item(i) );
                }
            }
        }
    }
}

var cleaner = new Cleaner( WSH.CreateObject("Outlook.Application") )

cleaner.cleanFolder("Video", 1)
cleaner.cleanFolder("Inbound NEWS", 2)
cleaner.cleanFolder("errors", 7)
cleaner.cleanFolder("FoxSports", 7)

WSH.Quit();

