/// Author: Ashwath
// Emails cookies to a given email address

function sendMail(data, email) {
    var link = "mailto:" + email
             + "&subject=" + escape("Javascript email")
             + "&body=" + escape(data)
    ;
    window.location.href = link;
}
sendMail('test', 'kashwathkumar1@gmail.com')