#ifndef LANGSWITCH_H
#define LANGSWITCH_H

#include <QObject>

class LangSwitch: public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString userName READ userName WRITE setUserName NOTIFY userNameChanged)
    //Q_PROPERTY(QString appPath READ getAppPath WRITE setAppPath)
    Q_PROPERTY(QString requestPermissions READ requestPermissions)
    Q_PROPERTY(QString getAppPath READ getAppPath)
    Q_PROPERTY(QString setAppPath WRITE setAppPath)

public:
    explicit LangSwitch(QObject *parent = nullptr);

    QString userName();
    QString getAppPath();
    //QString AppPathChange();
    QString setAppPath(const QString &appPathChange);
    void setUserName(const QString &userName);
    bool requestPermissions();

signals:
    void userNameChanged();

private:
    QString m_userName;
    QString m_appPath;
};

#endif // LANGSWITCH_H
