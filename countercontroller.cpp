#include "countercontroller.h"
#include <QDebug>
CounterController* CounterController::instance = nullptr;
CounterController::CounterController(QObject *parent)
    : QObject{parent}
{
    connect(this,&CounterController::incrementCount,this,&CounterController::incrementCountFunc);
    connect(this,&CounterController::decrementCount,this,&CounterController::decrementCountFunc);
}

int CounterController::getCount() const
{
    return count;
}

void CounterController::incrementCountFunc()
{
    count = count+1;
    emit valueChanged();
}

void CounterController::decrementCountFunc()
{
    count = count-1;
    emit valueChanged();
}

