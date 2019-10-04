import QtQuick 2.12
import QtQuick.Controls 2.5

import com.blackgrain.qml.quickdownload 1.0
import io.qt.examples.langswitch 1.0

import Qt.labs.platform 1.1
import QtQuick.Dialogs 1.2

Item {


    LangSwitch {
        id: langswitch
    }

    TextEdit {
        id: logEdit
        x: 20
        y: 222
        width: parent.width-40
        height: 167
        wrapMode: TextEdit.WrapAnywhere
        text: qsTr("Text Edit")
        font.pixelSize: 12
    }

    TextInput {
        id: texturl
        //x: 114
        y: 140
        x: 60

        width: parent.width-120
        height: 20
        text: qsTr("Text Input")
        font.pixelSize: 18
    }

    Button {
       x: 100
       y: 40
       text: "D start"
       onClicked: {
           //download1.running = true
           // download1.start
           console.log('before cpp value is' + langswitch.getnewAppPath);
           texturl.text = langswitch.getnewAppPath +  "/QuickDownload_test.zip";
           langswitch.setAppPath = texturl.text;
           download2.destination = texturl.text;
           console.log('QML url download is =' + download2.destination)
           download2.running = true
            download2.start
           //download3.running = true
           // download3.start
       }
    }

    Button {
       x: 200
       y: 80
       text: "Check path"
       onClicked: {
            texturl.text= langswitch.getnewAppPath
           logEdit.text = download2.hashsum + '\n' + logEdit.text
       }
    }

    Button {
       x: 200
       y: 40
       text: "Open"
       onClicked: {
           fileDialog.folder = texturl.text
            fileDialog.visible = true
           fileDialog.Open
            // texturl.text= fileDialog.fileUrls
            //fileDialog.Open
       }
    }

    Button {
       x: 280
       y: 40
       text: " Get. "
       //onClicked: folderDialog.open()
       onClicked: {
           console.log('getnewapppath')
           console.log('result cpp is ' + langswitch.getnewAppPath)
           texturl.text=langswitch.getnewAppPath

    }
    }

    Button {
       y: 80
       text: "Set.."
       onClicked: {
        //logEdit.text= folderDialog.folder + '\n' + logEdit.text
        //folder: texturl.text
           langswitch.setAppPath = texturl.text;
//           console.log('return from cpp ' + langswitch.setAppPath(texturl.text));
           console.log('return from cpp ');
       }
    }

    FolderDialog {
        id: folderDialog
        currentFolder: ""
            // StandardPaths.standardLocations(StandardPaths.PicturesLocation)[0]
        onFolderChanged: {
           texturl.text= folder;
            //logEdit.text= folder + '\n' + logEdit.text
        }
    }

    FileDialog {
        id: fileDialog
        title: "Please choose a file"
        folder: {
         if (texturl.text !='Text Input')  {
             console.log('custom path =' + texturl.text)
            fileDialog.folder= shortcuts.home
            texturl.text = shortcuts.home
         }
         else
         {  console.log('custom path =' + texturl.text)
            fileDialog.folder=texturl.text
         }
        }
        onAccepted: {
            console.log("You chose: " + fileDialog.fileUrls)
            texturl.text = fileDialog.fileUrls[0]
            logEdit.text= fileDialog.fileUrls[0] + '\n' + logEdit.text
            //Qt.quit()
        }
        onRejected: {
            console.log("Canceled")
            //Qt.quit()
        }
        Component.onCompleted: visible = true
    }

    Button {
       x: 100
       y: 80
       text: "Set path"
       onClicked: {
            console.info('start setAppPath')
            langswitch.setAppPath = texturl.text
           // console.log('setAppPath done and returned is =' + fff)
           //m_appPath = fff
           console.info('done setAppPath')
       }
    }




     Button {
        y: 40
        text: "Stor Req"
        onClicked: {
            console.info('permsreq requested before')
             if (langswitch.requestPermissions)
             {
                 // allowed local storage permissions
                 console.info('permsreq Allowed storage ok')
             }
             else
             {
                 // no permissions to local storage
                 console.info('permsreq Deny storage false')
             }

             console.info('permsreq function done')
             //console.log(langswitch.requestPermissions())
             //langswitch.setAppPath(texturl.text);
        }

    }



    Download {
        id: download1

        url: "http://placehold.it/350x150"
        //destination: "file:///tmp/test.png"
        overwrite: true
        destination: {

              //       "file://" + langswitch.getnewAppPath + "/test.png"
            console.log (download1.destination);
        }

//        running: true
        running: false

        followRedirects: true
        onRedirected: console.log('Redirected',url,'->',redirectUrl)

        onStarted: {
            console.log('Started download',url);
        }
        onError: console.error(errorString)
        onProgressChanged: console.log(url,'progress:',progress)
        onFinished: console.info(url,'done')
    }


    Download {
        id: download2
        hashsum: 'f1e554807f6e927530f7461e2ed5e8e3509c0245e082b2db5c88763a3764d1278b88d0d220f8b7050a71b2677e463fb7a3ad1d5b0fe6588c6ff18fddf977864c'
        url: "ftp://speedtest.tele2.net/5MB.zip"
        //destination: "file:///tmp/QuickDownload_test.zip"
        destination: {
            console.log('change distanation QML');
            "file://" + langswitch.getnewAppPath + "/QuickDownload_test.zip"
            console.log (download2.destination);
            console.log('changed distanation QML');
//         runningChanged.: {
//                logEdit.text= download2.progress + '\n' + logEdit.text;
//            }
        }

        overwrite: true
//        running: !download1.running
        running: false

        onStarted: console.log('Started download',url)
        onError: console.error(errorString)
        onProgressChanged: {
            console.log(url,'progress:',progress);
            progressBar.value=progress;
            //logEdit.text= progress + ' progress\n' + logEdit.text;
        }
        onFinished: {
              console.log(url,'qml download is done-qml onFineshed function hash =' + download2.hashsum.toString() + ' for file=' + langswitch.getnewAppPath);
            // 6 = QCryptographicHash::Sha512
         //console.log('checksum returned is ' + check_sum_file_sha512(download2.destination));
         console.log('checksum returned is ' + check_sum_file_sha512(langswitch.getnewAppPath));
         console.log('read result with hashsumresult is = ' + hashsumresult)
         console.log('original summ is ' + download2.hashsum);
         if (hashsumresult == 'f1e554807f6e927530f7461e2ed5e8e3509c0245e082b2db5c88763a3764d1278b88d0d220f8b7050a71b2677e463fb7a3ad1d5b0fe6588c6ff18fddf977864c')
        {
          console.log('checksum is ok');
          logEdit.text = 'file checksum is [OK] :)))) \n\n' + logEdit.text
        }
         else
        {
          console.log('checksum not ok');
          logEdit.text = 'ERROR file checksum is not OK :(((( \n\n' + logEdit.text
        }
    }
}

    ProgressBar {
        id: progressBar
        x: 111
        y: 367
        width: parent.width
        height: 16
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        value: 0.0
    }

    Download {
        id: download3

        url: "ftp://demo:password@test.rebex.net/readme.txt"
        //destination: "file:///tmp/QuickDownload_test_readme.txt"
        destination: "file://" + langswitch.getnewAppPath + "/QuickDownload_test_readme.txt"

        overwrite: true
        running: false

        onStarted: console.log('Started download',url)
        onError: console.error(errorString)
        onProgressChanged: console.log(url,'progress:',progress)
        onFinished: console.info(url,'done')
    }
}


