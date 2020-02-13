<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link href="${pageContext.request.contextPath }/resources/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

<meta charset='utf-8' />
<link href='${pageContext.request.contextPath}/resources/js/calendar2/core/main.css' rel='stylesheet' />
<link href='${pageContext.request.contextPath}/resources/js/calendar2/daygrid/main.css' rel='stylesheet' />
<link href='${pageContext.request.contextPath}/resources/js/calendar2/timegrid/main.css' rel='stylesheet' />
<link href='${pageContext.request.contextPath}/resources/js/calendar2/list/main.css' rel='stylesheet' />
<script src='${pageContext.request.contextPath}/resources/js/calendar2/core/main.js'></script>
<script src='${pageContext.request.contextPath}/resources/js/calendar2/core/locales-all.js'></script>
<script src='${pageContext.request.contextPath}/resources/js/calendar2/interaction/main.js'></script>
<script src='${pageContext.request.contextPath}/resources/js/calendar2/daygrid/main.js'></script>
<script src='${pageContext.request.contextPath}/resources/js/calendar2/timegrid/main.js'></script>
<script src='${pageContext.request.contextPath}/resources/js/calendar2/list/main.js'></script>

<script>

  document.addEventListener('DOMContentLoaded', function() {
    var initialLocaleCode = 'en';
    var localeSelectorEl = document.getElementById('locale-selector');
    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
      plugins: [ 'interaction', 'dayGrid', 'timeGrid', 'list' ],
      header: {
        left: 'prev,next ',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
      },
      defaultDate: '2019-08-12',
      locale: initialLocaleCode,
      buttonIcons: true, // show the prev/next text
      weekNumbers: true,
      navLinks: true, // can click day/week names to navigate views
      editable: true,
      eventLimit: true, // allow "more" link when too many events
      events: [
        {
          title: 'All Day Event',
          start: '2019-08-01'
        },
        {
          title: 'Long Event',
          start: '2019-08-07',
          end: '2019-08-10'
        },
        {
          groupId: 999,
          title: 'Repeating Event',
          start: '2019-08-09T16:00:00'
        },
        {
          groupId: 999,
          title: 'Repeating Event',
          start: '2019-08-16T16:00:00'
        },
        {
          title: 'Conference',
          start: '2019-08-11',
          end: '2019-08-13'
        },
        {
          title: 'Meeting',
          start: '2019-08-12T10:30:00',
          end: '2019-08-13T12:30:00'
        },
        {
          title: 'Lunch',
          start: '2019-08-12T12:00:00'
        },
        {
          title: 'Meeting',
          start: '2019-08-12T14:30:00'
        },
        {
          title: 'Happy Hour',
          start: '2019-08-12T17:30:00'
        },
        {
          title: 'Dinner',
          start: '2019-08-12T20:00:00'
        },
        {
          title: 'Birthday Party',
          start: '2019-08-13T07:00:00'
        },
        {
          title: 'Click for Google',
          url: 'http://google.com/',
          start: '2019-08-28'
        }
      ]
    });

    calendar.render();

    // build the locale selector's options
    calendar.getAvailableLocaleCodes().forEach(function(localeCode) {
      var optionEl = document.createElement('option');
      optionEl.value = localeCode;
      optionEl.selected = localeCode == initialLocaleCode;
      optionEl.innerText = localeCode;
//       localeSelectorEl.appendChild(optionEl);
    });

    // when the selected option changes, dynamically change the calendar option
//     localeSelectorEl.addEventListener('change', function() {
//       if (this.value) {
//         calendar.setOption('locale', this.value);
//       }
//     });

  });
    function here(date){
    	 $('.controll-modal-body').load("${pageContext.request.contextPath}/schedule/schedule.do?date="+date,function(){
 	        $('#scheduleModal').modal({backdrop: 'static', keyboard: false});
 	        $('#scheduleModal').modal({show:true});
 	        $(".modal-backdrop.in").css('opacity', 0.4);
 	        $(".controll-title").html("");
 	        $(".controll-title").html("개인일정관리");
 		});
    };

</script>
<style>
	.fc-content{
	background-color:white;
	border-color: white;}
/* 	.fc.event{ */
/* 	background-color:white; */
/* 	border:1px solid white;} */
  body {
    margin: 0;
    padding: 0;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }

  #top {
    background: #eee;
    border-bottom: 1px solid #ddd;
    padding: 0 10px;
    line-height: 40px;
    font-size: 12px;
  }

  #calendar {
    max-width: 900px;
    margin: 40px auto;
    padding: 0 10px;
  }
.fc-day{
 cursor:pointer;}
</style>
<!-- Modal -->
<div class="modal" tabindex="-1" role="dialog" id="scheduleModal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
        <div class="modal-header">
            <h5 class="modal-title controll-title"></h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
            </button>
        </div>
        <div class="modal-body controll-modal-body">
            <!-- <p>Modal body text goes here.</p> -->
        </div>
        
        </div>
    </div>
</div>


<div id='calendar'></div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
