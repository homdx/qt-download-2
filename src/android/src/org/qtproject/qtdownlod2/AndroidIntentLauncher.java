package org.qtproject.qtdownlod2;

import org.qtproject.qt5.android.QtNative;

import java.lang.String;
import java.io.File;
import android.content.Intent;
import android.util.Log;
import android.net.Uri;
import android.content.ContentValues;
import android.content.Context;


public class AndroidIntentLauncher
{
    protected AndroidIntentLauncher()
    {
    }

    public static int installApp(String appPackageName) {
        Log.i("JAVA", "started Java file " + appPackageName);
        if (QtNative.activity() == null)
            return -1;
        try {
                Intent intent = new Intent(Intent.ACTION_INSTALL_PACKAGE);
                intent.setDataAndType(Uri.fromFile(new File(appPackageName)),
                                                   "application/vnd.android.package-archive");
                intent.setFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION);

                Log.i("qt JAVA", "intentUri = intent.getData");

                //Uri uri = FileProvider.getUriForFile(context, AUTHORITY, file);

                //context.revokeUriPermission(uri, Intent.FLAG_GRANT_READ_URI_PERMISSION | Intent.FLAG_GRANT_WRITE_URI_PERMISSION);
                Log.i("qt JAVA", "started Java file addeded uri permission");
                intent.addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION);
                intent.putExtra(Intent.EXTRA_STREAM, appPackageName);
                Log.i("qt JAVA", "started Java file done addeded uri permission");
                Log.i("qt JAVA", "started Java file 1");
                QtNative.activity().startActivity(intent);
                Log.i("qt JAVA", "started Java file 2");

               return 0;
        } catch (android.content.ActivityNotFoundException anfe) {
            return -3;
        }
    }

}
