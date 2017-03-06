// list.html
var showBtn = $('#showBtn');
var qTable = $('.ask-table');

$('#showBtn').on('click', function(){
    qTable.toggleClass("active");
    
    if(qTable.hasClass('active')){
        showBtn.text('질문 목록접기');
    }else {
        showBtn.text('질문 목록보기');
    }
})