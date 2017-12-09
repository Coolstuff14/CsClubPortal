/* 
  Main Javascript file for CsClubJob
  
  Jacob Lee 2015
 */

function trimfield(str) 
{ 
    return str.replace(/^\s+|\s+$/g,''); 
}

function reset(){
  erTxt.innerHTML="";
  frm.titleTxt.className = frm.titleTxt.className.replace(" error", "");
  frm.descTxt.className = frm.descTxt.className.replace(" error", "");
  frm.progTxt.className = frm.progTxt.className.replace(" error", "");
  frm.emailTxt.className = frm.emailTxt.className.replace(" error", "");
}

// Method to verify the register form
function validateForm() {
  rtrn =0;
  frm = document.job;
  erTxt = document.getElementById("errortxt");
  reset();
  
    if (trimfield(frm.titleTxt.value) === "") {
      frm.titleTxt.focus();
      frm.titleTxt.className = frm.titleTxt.className + " error";
      erTxt.innerHTML= "*No Title";
      rtrn +=1;
    }
    
    if (trimfield(frm.descTxt.value) === "") {
      frm.descTxt.focus();
      frm.descTxt.className = frm.descTxt.className + " error";
      erTxt.innerHTML = erTxt.innerHTML + "<p>*No Description";
      rtrn += 1;
    }
    
    if (trimfield(frm.progTxt.value) === "") {
      frm.progTxt.focus();
      frm.progTxt.className = frm.progTxt.className + " error";
      erTxt.innerHTML = erTxt.innerHTML + "<p>*No Progress";
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
    
    if (frm.urgencyRb[0].checked==false && frm.urgencyRb[1].checked==false){
      erTxt.innerHTML = erTxt.innerHTML + "<p>*No Urgency Selected";
      rtrn += 1;
    }
    
   if (rtrn === 0){
     return(true);
   }else{
     return false;
   }
   
  }


