/********************************************************************************
** Form generated from reading UI file 'mainwindow.ui'
**
** Created by: Qt User Interface Compiler version 5.12.4
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_MAINWINDOW_H
#define UI_MAINWINDOW_H

#include <QtCore/QVariant>
#include <QtWidgets/QAction>
#include <QtWidgets/QApplication>
#include <QtWidgets/QLabel>
#include <QtWidgets/QMainWindow>
#include <QtWidgets/QMenu>
#include <QtWidgets/QMenuBar>
#include <QtWidgets/QStatusBar>
#include <QtWidgets/QWidget>

QT_BEGIN_NAMESPACE

class Ui_MainWindow
{
public:
    QAction *action_ffnen;
    QAction *actionBeenden;
    QAction *actionInfo;
    QAction *actionZeichne_Diagonale;
    QAction *action_Invertiere;
    QAction *action_Schwarz_wei_Darstellung;
    QWidget *centralWidget;
    QLabel *label;
    QMenuBar *menuBar;
    QMenu *menuDatei;
    QMenu *menuBearbeiten;
    QMenu *menuHilfe;
    QStatusBar *statusBar;

    void setupUi(QMainWindow *MainWindow)
    {
        if (MainWindow->objectName().isEmpty())
            MainWindow->setObjectName(QString::fromUtf8("MainWindow"));
        MainWindow->setWindowModality(Qt::ApplicationModal);
        MainWindow->resize(358, 337);
        QSizePolicy sizePolicy(QSizePolicy::Minimum, QSizePolicy::Minimum);
        sizePolicy.setHorizontalStretch(0);
        sizePolicy.setVerticalStretch(0);
        sizePolicy.setHeightForWidth(MainWindow->sizePolicy().hasHeightForWidth());
        MainWindow->setSizePolicy(sizePolicy);
        action_ffnen = new QAction(MainWindow);
        action_ffnen->setObjectName(QString::fromUtf8("action_ffnen"));
        actionBeenden = new QAction(MainWindow);
        actionBeenden->setObjectName(QString::fromUtf8("actionBeenden"));
        actionInfo = new QAction(MainWindow);
        actionInfo->setObjectName(QString::fromUtf8("actionInfo"));
        actionZeichne_Diagonale = new QAction(MainWindow);
        actionZeichne_Diagonale->setObjectName(QString::fromUtf8("actionZeichne_Diagonale"));
        action_Invertiere = new QAction(MainWindow);
        action_Invertiere->setObjectName(QString::fromUtf8("action_Invertiere"));
        action_Schwarz_wei_Darstellung = new QAction(MainWindow);
        action_Schwarz_wei_Darstellung->setObjectName(QString::fromUtf8("action_Schwarz_wei_Darstellung"));
        centralWidget = new QWidget(MainWindow);
        centralWidget->setObjectName(QString::fromUtf8("centralWidget"));
        label = new QLabel(centralWidget);
        label->setObjectName(QString::fromUtf8("label"));
        label->setGeometry(QRect(0, 0, 361, 281));
        QSizePolicy sizePolicy1(QSizePolicy::Ignored, QSizePolicy::Ignored);
        sizePolicy1.setHorizontalStretch(0);
        sizePolicy1.setVerticalStretch(0);
        sizePolicy1.setHeightForWidth(label->sizePolicy().hasHeightForWidth());
        label->setSizePolicy(sizePolicy1);
        label->setAlignment(Qt::AlignCenter);
        MainWindow->setCentralWidget(centralWidget);
        menuBar = new QMenuBar(MainWindow);
        menuBar->setObjectName(QString::fromUtf8("menuBar"));
        menuBar->setGeometry(QRect(0, 0, 358, 25));
        menuDatei = new QMenu(menuBar);
        menuDatei->setObjectName(QString::fromUtf8("menuDatei"));
        menuBearbeiten = new QMenu(menuBar);
        menuBearbeiten->setObjectName(QString::fromUtf8("menuBearbeiten"));
        menuHilfe = new QMenu(menuBar);
        menuHilfe->setObjectName(QString::fromUtf8("menuHilfe"));
        MainWindow->setMenuBar(menuBar);
        statusBar = new QStatusBar(MainWindow);
        statusBar->setObjectName(QString::fromUtf8("statusBar"));
        MainWindow->setStatusBar(statusBar);

        menuBar->addAction(menuDatei->menuAction());
        menuBar->addAction(menuBearbeiten->menuAction());
        menuBar->addAction(menuHilfe->menuAction());
        menuDatei->addAction(action_ffnen);
        menuDatei->addSeparator();
        menuDatei->addAction(actionBeenden);
        menuBearbeiten->addAction(actionZeichne_Diagonale);
        menuBearbeiten->addAction(action_Invertiere);
        menuBearbeiten->addAction(action_Schwarz_wei_Darstellung);
        menuHilfe->addAction(actionInfo);

        retranslateUi(MainWindow);
        QObject::connect(actionBeenden, SIGNAL(triggered()), MainWindow, SLOT(close()));
        QObject::connect(action_ffnen, SIGNAL(triggered()), MainWindow, SLOT(openFile()));
        QObject::connect(actionInfo, SIGNAL(triggered()), MainWindow, SLOT(showAboutBox()));
        QObject::connect(actionZeichne_Diagonale, SIGNAL(triggered()), MainWindow, SLOT(diagonalLinePicture()));
        QObject::connect(action_Invertiere, SIGNAL(triggered()), MainWindow, SLOT(invertPicture()));
        QObject::connect(action_Schwarz_wei_Darstellung, SIGNAL(triggered()), MainWindow, SLOT(blackWhitePicture()));

        QMetaObject::connectSlotsByName(MainWindow);
    } // setupUi

    void retranslateUi(QMainWindow *MainWindow)
    {
        MainWindow->setWindowTitle(QApplication::translate("MainWindow", "PiqRig", nullptr));
        action_ffnen->setText(QApplication::translate("MainWindow", "&\303\226ffnen", nullptr));
        actionBeenden->setText(QApplication::translate("MainWindow", "&Beenden", nullptr));
        actionInfo->setText(QApplication::translate("MainWindow", "&Info", nullptr));
        actionZeichne_Diagonale->setText(QApplication::translate("MainWindow", "Zeichne &Diagonale", nullptr));
        action_Invertiere->setText(QApplication::translate("MainWindow", "&Invertiere", nullptr));
        action_Schwarz_wei_Darstellung->setText(QApplication::translate("MainWindow", "&Schwarzwei\303\237-Darstellung", nullptr));
        label->setText(QApplication::translate("MainWindow", "Please open an image", nullptr));
        menuDatei->setTitle(QApplication::translate("MainWindow", "&Datei", nullptr));
        menuBearbeiten->setTitle(QApplication::translate("MainWindow", "&Bearbeiten", nullptr));
        menuHilfe->setTitle(QApplication::translate("MainWindow", "&Hilfe", nullptr));
    } // retranslateUi

};

namespace Ui {
    class MainWindow: public Ui_MainWindow {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_MAINWINDOW_H
