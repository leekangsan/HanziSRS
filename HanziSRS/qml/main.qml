import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3
import QtQml 2.2

ApplicationWindow {
    id: root
    title: "Hanzi SRS"
    visible: true
    width: 800
    height: 300

    menuBar: MenuBar {
        Menu {
            title: "File"
            MenuItem { text: "Import..." }
            MenuItem { text: "Backup database" }
            MenuSeparator {}
            MenuItem { text: "Quit" }
        }

        Menu {
            title: "Statistics"
            MenuItem { text: "Vocabularies" }
            MenuItem { text: "Hanzi" }
            MenuItem { text: "Reading" }
            MenuSeparator {}
            MenuItem { text: "Summary" }
        }

        Menu {
            title: "Settings"
            MenuItem {
                text: "User settings"
                onTriggered: {
                    openNewWindow('user_settings.qml')
                }
            }
            MenuItem { text: "Preferences" }
        }

        Menu {
            title: "About"
            MenuItem { text: "About Hanzi SRS" }
            MenuItem { text: "About Hanzi Level Project" }
            MenuSeparator {}
            MenuItem { text: "Contributing" }
            MenuItem { text: "Other projects" }
        }
    }

    ColumnLayout {
        id: main
        anchors.fill: parent
        anchors.margins: 10

        RowLayout {
            id: vocabRow
            anchors.left: parent.left
            anchors.right: parent.right

            RowLayout {
                Label {
                    text: "Vocabulary level : "
                }
                Label {
                    id: vocabLevel
                }
            }

            RowLayout {
                anchors.right: parent.right

                Button {
                    id: vocabNewButton
                    text: "New"
                    onClicked: {
                        openNewWindow("vocab_new.qml")
                    }
                }
                Button {
                    id: vocabLearningButton
                    text: "Learning"
                    enabled: false
                }
                Button {
                    id: vocabReviewButton
                    text: "Review"
                    enabled: false
                }
            }
        }
        RowLayout {
            Layout.fillWidth: true
            spacing: 20

            ProgressBar {
                id: vocabProgressBar
                value: 0  // Between 0 and 1
                Layout.fillWidth: true
            }
            Label {
                id: vocabProgressPercentage
                text: "  0%"
            }
        }

        RowLayout {
            id: hanziRow
            anchors.left: parent.left
            anchors.right: parent.right

            RowLayout {
                Label {
                    text: "Hanzi level : "
                }
                Label {
                    id: hanziLevel
                }
            }

            RowLayout {
                anchors.right: parent.right

                Button {
                    id: hanziNewButton
                    text: "New"
                    enabled: false
                }
                Button {
                    id: hanziLearningButton
                    text: "Learning"
                    enabled: false
                }
                Button {
                    id: hanziReviewButton
                    text: "Review"
                    enabled: false
                }
            }
        }
        RowLayout {
            Layout.fillWidth: true
            spacing: 20

            ProgressBar {
                id: hanziProgressBar
                value: 0  // Between 0 and 1
                Layout.fillWidth: true
            }
            Label {
                id: hanziProgressPercentage
                text: "  0%"
            }
        }

        RowLayout {
            id: readingRow
            anchors.left: parent.left
            anchors.right: parent.right

            RowLayout {
                Label {
                    text: "Reading level : "
                }
                Label {
                    id: readingLevel
                }
            }

            RowLayout {
                anchors.right: parent.right

                Button {
                    id: readingNewButton
                    text: "New"
                    enabled: false
                }
                Button {
                    id: readingLearningButton
                    text: "Learning"
                    enabled: false
                }
                Button {
                    id: readingReviewButton
                    text: "Review"
                    enabled: false
                }
            }
        }
        RowLayout {
            Layout.fillWidth: true
            spacing: 20

            ProgressBar {
                id: readingProgressBar
                value: 0  // Between 0 and 1
                Layout.fillWidth: true
            }
            Label {
                id: readingProgressPercentage
                text: "  0%"
            }
        }
    }

    function openNewWindow(qml) {
        var component = Qt.createComponent(qml)
        if( component.status != Component.Ready )
        {
            if( component.status == Component.Error )
                console.debug("Error:"+ component.errorString() );
            return; // or maybe throw
        }
        var window    = component.createObject(root)
        window.show()
    }
}