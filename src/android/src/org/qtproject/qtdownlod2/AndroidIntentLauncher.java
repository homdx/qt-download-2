package org.qtproject.qtdownlod2.androidintentlauncher;

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
        if (QtNative.activity() == null)
            return -1;
        try {
            Intent intent = new Intent(Intent.ACTION_VIEW);
            intent.setDataAndType(Uri.fromFile(new File(appPackageName)), 
                                               "application/vnd.android.package-archive");
            intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            QtNative.activity().startActivity(intent);
            return 0;
        } catch (android.content.ActivityNotFoundException anfe) {
            return -3;
        }
    }

}
