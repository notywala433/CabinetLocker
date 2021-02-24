import Felgo 3.0
import QtQuick 2.0

//All signals are emitted from this component
Item {

    //Open a lock when the deposit button is clicked. This signal searches for an open lock and open it

    signal deposit()

    // Open a rented cabinet providing a password

    signal retrieve(var cabinetNumber,var password)

    // Find the number of a vacant lock

    signal findVacantCabinet()

    // find a vacant cabinent for rental and set a password for it

    signal openCabinet(var cabinetNumber, var password)

    //Array of open locks
    signal vacantCabinets(var cabinets)

    //Open the Settings Page

    signal keySpressed()

}
