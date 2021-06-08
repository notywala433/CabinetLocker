/****************************************************************************
** Meta object code from reading C++ file 'relay.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.13.2)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "../relay.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'relay.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.13.2. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_Relay_t {
    QByteArrayData data[8];
    char stringdata0[76];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_Relay_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_Relay_t qt_meta_stringdata_Relay = {
    {
QT_MOC_LITERAL(0, 0, 5), // "Relay"
QT_MOC_LITERAL(1, 6, 15), // "printSerialData"
QT_MOC_LITERAL(2, 22, 0), // ""
QT_MOC_LITERAL(3, 23, 1), // "a"
QT_MOC_LITERAL(4, 25, 15), // "openAllChannels"
QT_MOC_LITERAL(5, 41, 11), // "openChannel"
QT_MOC_LITERAL(6, 53, 14), // "availablePorts"
QT_MOC_LITERAL(7, 68, 7) // "setPort"

    },
    "Relay\0printSerialData\0\0a\0openAllChannels\0"
    "openChannel\0availablePorts\0setPort"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_Relay[] = {

 // content:
       8,       // revision
       0,       // classname
       0,    0, // classinfo
       5,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // slots: name, argc, parameters, tag, flags
       1,    1,   39,    2, 0x0a /* Public */,

 // methods: name, argc, parameters, tag, flags
       4,    0,   42,    2, 0x02 /* Public */,
       5,    1,   43,    2, 0x02 /* Public */,
       6,    0,   46,    2, 0x02 /* Public */,
       7,    1,   47,    2, 0x02 /* Public */,

 // slots: parameters
    QMetaType::Void, QMetaType::QByteArray,    3,

 // methods: parameters
    QMetaType::Void,
    QMetaType::Void, QMetaType::Int,    3,
    QMetaType::QStringList,
    QMetaType::Void, QMetaType::QString,    3,

       0        // eod
};

void Relay::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<Relay *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->printSerialData((*reinterpret_cast< QByteArray(*)>(_a[1]))); break;
        case 1: _t->openAllChannels(); break;
        case 2: _t->openChannel((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 3: { QStringList _r = _t->availablePorts();
            if (_a[0]) *reinterpret_cast< QStringList*>(_a[0]) = std::move(_r); }  break;
        case 4: _t->setPort((*reinterpret_cast< QString(*)>(_a[1]))); break;
        default: ;
        }
    }
}

QT_INIT_METAOBJECT const QMetaObject Relay::staticMetaObject = { {
    &QObject::staticMetaObject,
    qt_meta_stringdata_Relay.data,
    qt_meta_data_Relay,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *Relay::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *Relay::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_Relay.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int Relay::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 5)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 5;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 5)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 5;
    }
    return _id;
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
