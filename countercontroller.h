#ifndef COUNTERCONTROLLER_H
#define COUNTERCONTROLLER_H

#include <QObject>

class CounterController : public QObject
{
    Q_OBJECT
    explicit CounterController(QObject *parent = nullptr);
    static CounterController* instance;
public:
    CounterController(const CounterController& obj) = delete;
    static CounterController* getInstance(){
        if(instance == nullptr)
            instance = new CounterController();
        return instance;
    }
    Q_INVOKABLE int getCount() const;
private:
    int count = 0;
signals:
    incrementCount();
    decrementCount();
    valueChanged();
public slots:
    void incrementCountFunc();
    void decrementCountFunc();
};

#endif // COUNTERCONTROLLER_H
