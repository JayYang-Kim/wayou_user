$("#from").datepicker({
  dateFormat: 'yy/mm/dd', //날짜 표시 형식
  minDate: '0',//오늘부터 선택가능
  dayNames:[
	  '일요일','월요일','화요일','수요일','목요일','금요일','토요일'
	],
	dayNamesMin:[
		'일','월','화','수','목','금','토'
	],
	monthNames:[
		'1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'
	],
	monthNamesShort:[
		'1','2','3','4','5','6','7','8','9','10','11','12'
	]
});
$("#from").datepicker("setDate", "0");//Set date x day(s) from current date and display it in input field. Needs to be done after initialization of datepicker.
  
$("#to").datepicker({
  dateFormat: 'yy/mm/dd',
  minDate: '0d',//Set date x days from today
  dayNames:[
		'월요일','화요일','수요일','목요일','금요일','토요일','일요일'
		],
		dayNamesMin:[
			'월','화','수','목','금','토','일'
		],
		monthNames:[
			'1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'
		],
		monthNamesShort:[
			'1','2','3','4','5','6','7','8','9','10','11','12'
		]
});
