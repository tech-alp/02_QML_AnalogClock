#include "stopwatch.h"

Stopwatch::Stopwatch(QObject *parent)
    : QObject{parent}, m_timer{new QTimer},m_timer2{new QTimer}, m_best{}, m_display{}
{
    qDebug() << m_time.isValid();

}

void Stopwatch::start() {
    m_timer->start(10);
    m_timer2->start(900);
    connect(m_timer2,SIGNAL(timeout()),this,SLOT(time()));
    connect(m_timer,SIGNAL(timeout()),this,SLOT(timerChanged()));
}

void Stopwatch::timerChanged() {
    m_best += 0.01;
    emit bestChanged();
}

void Stopwatch::time()
{
    m_time = QTime::currentTime();
    hour();
    minute();
    second();
    emit timeChanged();
}

void Stopwatch::stop() {
    m_timer->stop();
    delete m_timer;
    m_timer = new QTimer;
}


double Stopwatch::best() {
    return m_best;
}

int Stopwatch::hour() const
{
    return m_time.hour();
}

int Stopwatch::second() const
{
    return m_time.second();
}

int Stopwatch::minute() const
{
    return m_time.minute();
}

QString Stopwatch::display()
{
    QString str = QString::number(m_best,'f',2);
    return str;
}

void Stopwatch::setBest(double value) {
    m_best = value;
}

void Stopwatch::setDisplay(QString value)
{
    QVariant val = value;
    bool ok = false;
    m_display = val.toInt(&ok);
    if(ok)
        qDebug() << "!Not a Number";
    emit displayChanged();
}

void Stopwatch::reset() {
    m_best = 0.0;
    emit bestChanged();
}


