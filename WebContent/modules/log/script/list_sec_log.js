function viewSecLog(grid, rowData, keyData) {
	if (keyData) {
		$.open('~/secLog/viewSecLog.do?logId=' + keyData, 700, null);
	}
}

$(function() {
			$("#BEGIN_TIME").calendar({
						isShowWeek : true,
						dateFmt : 'yyyy-MM-dd',
						onpicked : function() {
							var endTime = document.getElementById("END_TIME").value;
							var beginTime = this.value;
							if (beginTime && endTime) {
								var t = compareDate(beginTime, endTime);

								if (t > 0) {
									$.messageBox.info({message:"开始时间不能大于结束时间!"});
									this.value = ""
								}
							}
						}
					});
			$("#END_TIME").calendar({
						isShowWeek : true,
						dateFmt : 'yyyy-MM-dd',
						onpicked : function() {
							var beginTime = document.getElementById("BEGIN_TIME").value;
							var endTime = this.value;
							if (beginTime && endTime) {
								var t = compareDate(beginTime, endTime);

								if (t > 0) {
									$.messageBox.info({message:"结束时间不能小于开始时间!"});
									this.value = ""
								}
							}
						}
					});
		});

function stringToTime(dateStr) {
	var day = dateStr.split('-');
	var date = new Date(Number(day[0]), Number(day[1]) - 1, Number(day[2]));
	return date;
}

function compareDate(dateString1, dateString2) {
	if (dateString1 != null && dateString2 != null) {
		var t1 = stringToTime(dateString1);
		var t2 = stringToTime(dateString2);
		return t1 - t2;
	}
	return 0;
}

function doOnRowDoubleClicked(rowIndex, colIndex) {
	$.open('~/secLog/viewSecLog.do?logId=' + secLogGrid.getCellValue(rowIndex, "ID"), 700);
}