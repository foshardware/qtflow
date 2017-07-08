#-------------------------------------------------
#
# Project created by QtCreator 2017-06-25T15:09:44
#
#-------------------------------------------------

QT       += core gui script

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = qtflow
TEMPLATE = app

# The following define makes your compiler emit warnings if you use
# any feature of Qt which as been marked as deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

FLEXSOURCES = lexmagic.l \
    lexsettings.l
BISONSOURCES = yymagic.y \
    yysettings.y

OTHER_FILES +=  \
    $$FLEXSOURCES \
    $$BISONSOURCES

SOURCES += main.cpp\
        mainwindow.cpp \
    magicparser.cpp \
    grid.cpp \
    templates.cpp \
    project.cpp \
    settings.cpp \
    settingsparser.cpp \
    session.cpp \
    environment.cpp \
    edit.cpp \
    editor.cpp \
    verilog.cpp \
    savechanges.cpp \
    welcome.cpp \
    iopads.cpp \
    dependencies.cpp \
    modules.cpp

HEADERS  += mainwindow.h \
    magicparser.h \
    common.h \
    grid.h \
    environment.h \
    templates.h \
    project.h \
    settings.h \
    settingsparser.h \
    session.h \
    app.h \
    constants.h \
    denvironment.h \
    edit.h \
    editor.h \
    verilog.h \
    savechanges.h \
    welcome.h \
    iopads.h \
    dependencies.h \
    modules.h

FORMS    += mainwindow.ui \
    grid.ui \
    templates.ui \
    environment.ui \
    edit.ui \
    savechanges.ui \
    welcome.ui \
    iopads.ui \
    modules.ui

flexsource.input = FLEXSOURCES
flexsource.output = ${QMAKE_FILE_BASE}.cpp
flexsource.commands = flex --header-file=${QMAKE_FILE_BASE}.h -o ${QMAKE_FILE_BASE}.cpp ${QMAKE_FILE_IN}
flexsource.variable_out = SOURCES
flexsource.name = Flex Sources ${QMAKE_FILE_IN}
flexsource.CONFIG += target_predeps

QMAKE_EXTRA_COMPILERS += flexsource

flexheader.input = FLEXSOURCES
flexheader.output = ${QMAKE_FILE_BASE}.h
flexheader.commands = @true
flexheader.variable_out = HEADERS
flexheader.name = Flex Headers ${QMAKE_FILE_IN}
flexheader.CONFIG += target_predeps no_link

QMAKE_EXTRA_COMPILERS += flexheader

bisonsource.input = BISONSOURCES
bisonsource.output = ${QMAKE_FILE_BASE}.cpp
bisonsource.commands = bison -d --defines=${QMAKE_FILE_BASE}.h -o ${QMAKE_FILE_BASE}.cpp ${QMAKE_FILE_IN}
bisonsource.variable_out = SOURCES
bisonsource.name = Bison Sources ${QMAKE_FILE_IN}
bisonsource.CONFIG += target_predeps

QMAKE_EXTRA_COMPILERS += bisonsource

bisonheader.input = BISONSOURCES
bisonheader.output = ${QMAKE_FILE_BASE}.h
bisonheader.commands = @true
bisonheader.variable_out = HEADERS
bisonheader.name = Bison Headers ${QMAKE_FILE_IN}
bisonheader.CONFIG += target_predeps no_link

QMAKE_EXTRA_COMPILERS += bisonheader
