function textwbox(text){
  var x = document.createTextNode(text);
  var div= document.createElement("div");
  div.appendChild(x);
  div.style.display="inline";
  return div;
}
function addproperties(elem){

}

function addrow(val,numstar,numbranch){
  var ul=document.getElementById("list");
  var li = document.createElement("li");
  var div=document.createElement("div"),
  //divin2 is div with only a text with the repo name
  divin2 =textwbox(val);
  //divin corresponds to the div with the star and branch images
  var divin= document.createElement("div");
  var star=document.createElement("img");
  var branch= document.createElement("img");
  divin.appendChild(star);
  divin.style.position="relative";
  divin.style.right="0px";
  star.src="https://octicons.github.com/img/og/star.png";
  star.style.height="25px";
  star.style.width="auto";
  branch.src="https://octicons.github.com/img/og/git-branch.png";
  branch.style.height="25px";
  branch.style.width="auto";
  var nstar=textwbox(numstar);
  nstar.style.position="relative";
  nstar.style.top="0px";
  divin.appendChild(textwbox(numstar));
  divin.appendChild(branch);
  divin.appendChild(textwbox(numbranch));
  divin.style.display="inline";
  divin.style.float="right";

  div.appendChild(divin2);
  div.appendChild(divin);
  li.appendChild(div);
  ul.appendChild(li);
  console.log(ul);
}
function cleanRepos(){
  var ul=document.getElementById("list");
  ul.innerHTML="";
}

function dorepostuff(x){

  //access all repo information
  var listrep=JSON.parse(Get(x));
  //remove all elements
  cleanRepos();

  //add a row for each element
  for (var i = 0; i < listrep.length; i++) {
    addrow(listrep[i]["name"],listrep[i]["stargazers_count"],
      listrep[i]["forks_count"]);
  }
}

function search(){
  var query=document.getElementById("search").value;
  //we load the global api of Github
  var x= JSON.parse(Get("https://api.github.com"));
  //we load the api for user
  look4user=x["user_url"];
  temp=Get(look4user.replace("{user}",query));
  x = JSON.parse(temp);
  if(x.hasOwnProperty("bio") && x.hasOwnProperty("login")
    && x.hasOwnProperty("name")) {
    //Obtained user JSON correctly
    //show stuff
    document.getElementById("nosuccessresult").style.display='none';
    document.getElementById("successresult").style.display='inline-block';
    //update fields
    document.getElementById("username").innerHTML='@' +(x["login"]);
    document.getElementById("fullname").innerHTML=(x["name"]);
    document.getElementById("bio").innerHTML= (x["bio"]);
    document.getElementById("profilepic").src=(x["avatar_url"]);
    //get repo information and update on document
    dorepostuff(x["repos_url"]);
  }else{
    //got a wrong JSON
    document.getElementById("nosuccessresult").style.display='inline-block';
    document.getElementById("successresult").style.display='none';
  }
}

function Get(yourUrl){
    var Httpreq = new XMLHttpRequest(); // a new request
    Httpreq.open("GET",yourUrl,false);
    Httpreq.send(null);
    return Httpreq.responseText;
}




let stateCheck = setInterval(() => {
  if (document.readyState === 'complete') {
    clearInterval(stateCheck);
    document.getElementById('search')
        .addEventListener("keyup", function(event) {
        event.preventDefault();
        if (event.keyCode == 13) search();
    });
  }
}, 100);
