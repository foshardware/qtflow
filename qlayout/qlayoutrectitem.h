#ifndef QLAYOUTRECTITEM_H
#define QLAYOUTRECTITEM_H

#include <QGraphicsRectItem>
#include <QGraphicsSceneContextMenuEvent>
#include <QAction>
#include <QMenu>
#include <QGraphicsScene>
#include <QDebug>
#include <QPainter>

class QLayoutRectItem : public QGraphicsItem
{
public:
	QLayoutRectItem(QGraphicsItem *parent = Q_NULLPTR);
	QLayoutRectItem(qreal x, qreal y, qreal w, qreal h, QGraphicsItem *parent = Q_NULLPTR);

	bool contains(const QPointF &point) const Q_DECL_OVERRIDE;
	bool isLocked();

	void setRect(qreal x, qreal y, qreal w, qreal h);
	void setCutOutStart(qreal x, qreal y);
	void updateRecentCutOut(qreal w, qreal h);
	void setColor(QColor c);

	qreal width() const;
	qreal height() const;

	QVector<QRectF> getStripes();

	QPainterPath shape() const;
	QRectF boundingRect() const;
	void paint(QPainter *painter, const QStyleOptionGraphicsItem *option, QWidget *widget = Q_NULLPTR);

protected:
	void contextMenuEvent(QGraphicsSceneContextMenuEvent *event);

private:
	QVector<QRectF> cutOutRectangleFromGroup(QVector<QRectF> group, QRectF cutout);

	QRectF m_externalRect;
	QVector<QRectF*> m_cutoutRectangles;
	QRectF *m_recentCutOutRectangle;

	QPointF m_orig;
	bool m_locked;
	QColor m_color;
};

#endif // QLAYOUTRECTITEM_H