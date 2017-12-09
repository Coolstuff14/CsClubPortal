/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function trimfield(str) 
{ 
    return str.replace("\\s",""); 
}

function reset(){
  erTxt.innerHTML="";
  frm.fName.className = frm.fName.className.replace(" error", "");
  frm.lName.className = frm.lName.className.replace(" error", "");
  frm.usernameTxt.className = frm.usernameTxt.className.replace(" error", "");
  frm.phoneTxt.className = frm.phoneTxt.className.replace(" error", "");
  frm.emailTxt.className = frm.emailTxt.className.replace(" error", "");
  frm.passTxt.className = frm.passTxt.className.replace(" error", "");
  frm.confpassTxt.className = frm.confpassTxt.className.replace(" error", "");
  frm.onecardTxt.className = frm.onecardTxt.className.replace(" error", "");
}

// Method to verify the register form
function validateForm() {
  rtrn =0;
  frm = document.register;
  erTxt = document.getElementById("errortxt");
  reset();
  
    if (trimfield(frm.fName.value)==="") {
      frm.fName.focus();
      frm.fName.className = frm.fName.className + " error";
      erTxt.innerHTML= "*No First Name";
      rtrn +=1;
    }
    
    if (trimfield(frm.lName.value)==="") {
      frm.lName.focus();
      frm.lName.className = frm.lName.className + " error";
      erTxt.innerHTML = erTxt.innerHTML + "<p>*No Last Name";
      rtrn += 1;
    }
    
    atpos = frm.emailTxt.value.indexOf("@");
    dotpos = frm.emailTxt.value.lastIndexOf(".");  
    if (atpos < 1 || ( dotpos - atpos < 2 )){
      frm.emailTxt.focus();
      frm.emailTxt.className = frm.emailTxt.className + " error";
      erTxt.innerHTML = erTxt.innerHTML + "<p>*Email Not Valid";
      rtrn += 1;
    }
    
     phoneNo = frm.phoneTxt.value;
    if (!(phoneNo==="")){
      //validate phone numbers of format "1234567890"
      if (phoneNo.match("\\d{10}"));
      //validating phone number with -, . or spaces
      else if(phoneNo.match("\\d{3}[-\\.\\s]\\d{3}[-\\.\\s]\\d{4}"));
      //validating phone number with extension length from 3 to 5
      else if(phoneNo.match("\\d{3}-\\d{3}-\\d{4}\\s(x|(ext))\\d{3,5}"));
      //validating phone number where area code is in braces ()
      else if(phoneNo.match("\\(\\d{3}\\)-\\d{3}-\\d{4}"));
      //return false if nothing matches the input
      else {
      frm.phoneTxt.focus();
      frm.phoneTxt.className = frm.phoneTxt.className + " error";
      erTxt.innerHTML = erTxt.innerHTML + "<p>*Phone # Not Valid";
      rtrn += 1;
      }
    }

    if (trimfield(frm.usernameTxt.value)==="") {
      frm.usernameTxt.focus();
      frm.usernameTxt.className = frm.usernameTxt.className + " error";
      erTxt.innerHTML = erTxt.innerHTML + "<p>*No Username";
      rtrn += 1;
    }
    
    if (trimfield(frm.ebEdit.value)==="0"){
      
      if (trimfield(frm.passTxt.value)==="") {
      frm.passTxt.focus();
      frm.passTxt.className = frm.passTxt.className + " error";
      erTxt.innerHTML = erTxt.innerHTML + "<p>*No Password";
      rtrn += 1;
    }
    
      pass = (frm.passTxt.value);
      confpass = (frm.confpassTxt.value);
      
     if ((confpass==="") || (!(confpass===pass))){
      frm.confpassTxt.className = frm.confpassTxt.className + " error";
      erTxt.innerHTML = erTxt.innerHTML + "<p>*Passwords Don't Match";
      rtrn += 1;
    }
    }

    if ((!(trimfield(frm.onecardTxt.value)==="")) && trimfield(frm.onecardTxt.value).length < 20) {
      frm.onecardTxt.focus();
      frm.onecardTxt.className = frm.onecardTxt.className + " error";
      erTxt.innerHTML = erTxt.innerHTML + "<p>*One Card Not Correct Length";
      rtrn += 1;
    }
    
   if (rtrn === 0){
     return(true);
   }else{
     return false;
   }
   
  }


