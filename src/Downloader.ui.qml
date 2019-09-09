import QtQuick 2.12
import QtQuick.Controls 2.5

import com.blackgrain.qml.quickdownload 1.0
import io.qt.examples.langswitch 1.0

import Qt.labs.platform 1.0
import QtQuick.Dialogs 1.2


Item {


    LangSwitch {
        id: langswitch
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

    Connections {
        target: texturl
        onClicked: {
                langswitch.setAppPath = texturl.text;
        }
    }

    Button {
       x: 100
       y: 40
       text: "D start"
       onClicked: {
           download1.running
            download1.start
           download2.running
            download2.start
           download3.running
            download3.start
       }
    }

    Button {
       x: 200
       y: 80
       text: "Check path"
       onClicked: {
            texturl.text= langswitch.getAppPath
       }
    }

    Button {
       x: 200
       y: 40
       text: "Open"
       onClicked: {
           fileDialog.Open
            // texturl.text= fileDialog.fileUrls
            //fileDialog.Open
       }
    }

    FileDialog {
        id: fileDialog
        title: "Please choose a file"
        folder: {
         if (texturl.text !='Text Input')  {
             console.log('custom path =' + texturl.text)
            fileDialog.folder=shortcuts.home
         }
         else
         {  console.log('custom path =' + texturl.text)
            fileDialog.folder=texturl.text
         }
        }
        onAccepted: {
            console.log("You chose: " + fileDialog.fileUrls)
            texturl.text = fileDialog.fileUrls[0]
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
        y: 340
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
        destination: "file://" + langswitch.GetAppPath + "/test.png"

//        running: true

        followRedirects: true
        onRedirected: console.log('Redirected',url,'->',redirectUrl)

        onStarted: console.log('Started download',url)
        onError: console.error(errorString)
        onProgressChanged: console.log(url,'progress:',progress)
        onFinished: console.info(url,'done')

    }


    Download {
        id: download2

        url: "ftp://speedtest.tele2.net/5MB.zip"
        //destination: "file:///tmp/QuickDownload_test.zip"
        destination: "file://" + langswitch.GetAppPath + "/QuickDownload_test.zip"

        overwrite: true
//        running: !download1.running

        onStarted: console.log('Started download',url)
        onError: console.error(errorString)
        onProgressChanged: console.log(url,'progress:',progress)
        onFinished: console.info(url,'done')
    }

    Download {
        id: download3

        url: "ftp://demo:password@test.rebex.net/readme.txt"
        //destination: "file:///tmp/QuickDownload_test_readme.txt"
        destination: "file://" + langswitch.GetAppPath + "/QuickDownload_test_readme.txt"

        overwrite: true
 //       running: true

        onStarted: console.log('Started download',url)
        onError: console.error(errorString)
        onProgressChanged: console.log(url,'progress:',progress)
        onFinished: console.info(url,'done')
    }
}


