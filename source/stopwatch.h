#ifndef STOPWATCH_H
#define STOPWATCH_H

#include <QObject>
#include <QTimer>
#include <QVariant>
#include <QTime>
#include <QDebug>
#include <QString>

class Stopwatch : public QObject
{
    Q_OBJECT
    Q_PROPERTY(double best READ best WRITE setBest NOTIFY bestChanged);
    Q_PROPERTY(int minute READ minute NOTIFY bestChanged)
    Q_PROPERTY(int second READ second NOTIFY bestChanged)
    Q_PROPERTY(int hour READ hour NOTIFY bestChanged)
    Q_PROPERTY(QString display READ display WRITE setDisplay NOTIFY displayChanged);

public:
    explicit Stopwatch(QObject *parent = nullptr);

signals:
    void bestChanged();
    void displayChanged();
    void timeChanged();

public slots:
    void start();
    void stop();
    void reset();
    void timerChanged();
    void time();

private:
    QTimer* m_timer;
    QTimer* m_timer2;
    QTime m_time{QTime::currentTime()};
    double m_best;
    double best();
    int hour() const;
    int second() const;
    int minute() const;
    QString display();
    QString m_display;
    void setBest(double value);
    void setDisplay(QString value);

};

#endif // STOPWATCH_H
