import Felgo 3.0
import QtQuick 2.0
import Qt.labs.settings 1.0

//All dynamic components loaded on the go

Item {

    //Password Page property

    property alias passworPage: myPassword

    //Retrieve Page property

    property alias retrievePage: retrievePage

    //Settings Page property

    property alias settingsPage: settingsPager

    //Out of Order
    property alias outoforderPage: outOfOrderPage

    //Verify admin
    property alias verifyAdminPage: verifyAdmin

    //PrescriptionPage

    property alias prescriptionPage: prescriptionPage

    //Prescription Details

    property alias prescriptionDetailPage: prescriptionDetailPage

    //Occupied Details Page

    property alias occupiedDetailPage: occupiedDetails


    //Admin Page
    property alias adminPage: adminPage
    //Admin Page
    Component{

        id: adminPage
        AdminPage{}


    }

    //OccupiedDetailPage
    Component{

        id: occupiedDetails
        OccupiedDetailPage{}


    }

    // Settings
    Component{

        id: settingsPager
        AppSettings{}


    }

    // Prescription Details
    Component{

        id: prescriptionDetailPage
        PrescriptionDetailPage{}


    }


    // Prescription
    Component{

        id: prescriptionPage
        PrescriptionPage{}


    }


    //Password page

    Component{

        id:myPassword

        PasswordPage{}

             }

    //Admin Password page

    Component{

        id:verifyAdmin

       AdminVerifyPage{}

             }


    //Retrieve page

    Component{

    id:retrievePage

        Retrievepage{}

    }

    //OutOfOrder
    Component{

    id:outOfOrderPage

        OutOfOrder{}

    }



    }

