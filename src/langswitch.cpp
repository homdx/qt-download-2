#include "langswitch.h"
#include <QtDebug>
#include <QtGui>

#ifdef Q_OS_ANDROID
#include <QtAndroidExtras>
#endif /* Q_OS_ANDROID */


LangSwitch::LangSwitch(QObject *parent) :
    QObject(parent)
{
}

QString LangSwitch::getAppPath()
{
    qDebug() << "started getAppPath cpp function";
    qDebug() << "m_appPath path now is: " << m_appPath;
    QString AppPath = qApp->applicationDirPath();
    qDebug() << "App path : " << qApp->applicationDirPath();
    return AppPath;
}

void LangSwitch::setAppPath(const QString &appPathChange)
{
    qDebug() << "started setAppPath cpp function";
    qDebug() << "App path now is: " << appPathChange;
    qDebug() << "Old path m_AppPath value is: " << appPathChange;
    m_appPath = appPathChange;
    //return m_appPath;
}
QString LangSwitch::userName()
{
    return m_userName;
}

bool LangSwitch::requestPermissions()
{
    #ifdef Q_OS_ANDROID
    qDebug() << "requestPermissions - request permissions";
    QtAndroid::PermissionResult r = QtAndroid::checkPermission("android.permission.WRITE_EXTERNAL_STORAGE");
    qDebug() << "requestPermissions - requested permissions";
    if(r == QtAndroid::PermissionResult::Denied) {
        QtAndroid::requestPermissionsSync( QStringList() << "android.permission.WRITE_EXTERNAL_STORAGE" );
        r = QtAndroid::checkPermission("android.permission.WRITE_EXTERNAL_STORAGE");
        if(r == QtAndroid::PermissionResult::Denied) {
            qDebug() << "requestPermissions - storage is deny!!! permissions";
            return false;
        }
    }
    #endif
    qDebug() << "requestPermissions - allowed permissions";
    return true;
}


void LangSwitch::setUserName(const QString &userName)
{
    qDebug() << userName;
    qDebug() << m_userName;


    if (userName == m_userName)
        return;

    m_userName = userName;
    emit userNameChanged();
}
