#ifndef MAINEDIT_H
#define MAINEDIT_H

#include "editor.h"
#include "projectstreemodel.h"
#include "modulestreemodel.h"
#include "new.h"

#include <QWidget>
#include <QFileSystemModel>
#include <QProcess>
#include <QSettings>

namespace Ui {
	class Edit;
}

class Edit : public QWidget
{
	Q_OBJECT

public:
	explicit Edit(QWidget *parent = 0);
	~Edit();

	void setDirectory(const QString &path);

	void loadFile(QString path);
	void saveFile(QString path);

public slots:
	void saveAndExit(int);

	void onFilesContextMenu(const QPoint&);
	void onOpenTcsh(bool);
	void onTcshError(QProcess::ProcessError);

	void onProjectsContextMenu(const QPoint&);
	void onProjectsSetTopModule(bool);
	void onCreateTestbench(bool);
	void onCreateVerilogModule(bool);

	void onModulesContextMenu(const QPoint&);
	void onModulesSetTopModule(bool);

	void onLoadFile(QFileInfo&);

private slots:
	void on_filesView_doubleClicked(const QModelIndex &index);

	void on_tabbedEditor_currentChanged(int index);

	void on_tabbedEditor_tabCloseRequested(int index);

	void on_treeSelection_currentIndexChanged(int index);

	void on_projectsView_doubleClicked(const QModelIndex &index);

	void on_modulesView_doubleClicked(const QModelIndex &index);

private:
	Ui::Edit *ui;
	New *createWidget;

	QList<IEditor*> *opened;
	QFileSystemModel *filesystem;
	ProjectsTreeModel *projects;
	ModulesTreeModel *modules;

	QMenu *filesContext;
	QAction *openTcsh;

	QMenu *projectsContext;
	QAction *setProjectsTopModule;
	QAction *createTestbench;
	QAction *createVerilogModule;

	QMenu *modulesContext;
	QAction *setModulesTopModule;
};

#endif // MAINEDIT_H
