#include <QApplication>
#include <QPushButton>
#include <version.h>
#include <string>

int main(int argc, char **argv)
{
    QApplication app(argc, argv);

    //QPushButton button("Version: " + gGIT_VERSION);
    std::string versionString = "Version: ";
    versionStirng.append(gGIT_VERSION);
    QPushButton button(versionString);
    button.show();

    return app.exec();
}