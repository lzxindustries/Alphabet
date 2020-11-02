#include <QApplication>
#include <QPushButton>
#include <version.h>

int main(int argc, char **argv)
{
    QApplication app(argc, argv);

    //QPushButton button("Version: " + gGIT_VERSION);
    QPushButton button("Version: ");
    button.show();

    return app.exec();
}