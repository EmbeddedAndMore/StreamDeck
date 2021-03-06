import QtQuick 2.0


Canvas {
//    anchors.fill: parent
    id: clock_circle
    onPaint: {
        var ctx = getContext("2d");
        ctx.reset();

        var centreX = width / 2;
        var centreY = height / 2;

        ctx.beginPath();
        ctx.fillStyle = "black";
        ctx.moveTo(centreX, centreY);
        ctx.arc(centreX, centreY, width / 4, 0, Math.PI * 0.5, false);
        ctx.lineTo(centreX, centreY);
        ctx.fill();

        ctx.beginPath();
        ctx.fillStyle = "red";
        ctx.moveTo(centreX, centreY);
        ctx.arc(centreX, centreY, width / 4, Math.PI * 0.5, Math.PI * 2, false);
        ctx.lineTo(centreX, centreY);
        ctx.fill();
    }
}
