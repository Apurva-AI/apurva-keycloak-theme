<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true displayRequiredFields=false displayWide=false showAnotherWayIfPresent=true>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" class="${properties.kcHtmlClass!}">
   <head>
      <meta charset="utf-8">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
      <meta name="robots" content="noindex, nofollow">
      <link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=Open+Sans" />
      <script src='https://kit.fontawesome.com/a076d05399.js'></script>
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
      <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100;200;300;400;500;600;700;800&display=swap" rel="stylesheet">
     <!-- <link href="//db.onlinewebfonts.com/c/8d7db40f4a18fe878fd4e0577ddbb03b?family=Campaign+Grotesk" rel="stylesheet"
         type="text/css" />-->
      <#if properties.meta?has_content>
      <#list properties.meta?split(' ') as meta>
      <meta name="${meta?split('==')[0]}" content="${meta?split('==')[1]}"/>
      </#list>
      </#if>
      <title>${msg("loginTitle",(realm.displayName!''))}</title>
      <link rel="icon" href="${url.resourcesPath}/img/faviconNew.png" />
      <#if properties.styles?has_content>
      <#list properties.styles?split(' ') as style>
      <link href="${url.resourcesPath}/${style}" rel="stylesheet" />
      </#list>
      </#if>
      <#if properties.scripts?has_content>
      <#list properties.scripts?split(' ') as script>
      <script src="${url.resourcesPath}/${script}" type="text/javascript"></script>
      </#list>
      </#if>
      <#if scripts??>
      <#list scripts as script>
      <script src="${script}" type="text/javascript"></script>
      </#list>
      </#if>
      <script>
            function showDropdown() {
               document.getElementById("myDropdown").classList.toggle("show");
            }

             function handleCheckboxClick(checkbox) {
            var isChecked = checkbox.checked;
            var loginButton = document.getElementById("kc-login");
            if (isChecked) {
                if (loginButton) {
                loginButton.disabled = false;
            }
            } else {
            if (loginButton) {
                loginButton.disabled = true;
            }
            }
        }

            window.onclick = function(event) {
               if (!event.target.matches('.dropbtn')) {
               var dropdowns = document.getElementsByClassName("dropdown-content");
               var i;
                  for (i = 0; i < dropdowns.length; i++) {
                     var openDropdown = dropdowns[i];
                     if (openDropdown.classList.contains('show')) {
                     openDropdown.classList.remove('show');
                  }
               }
            }
            }
         </script>
   </head>
   <body class="${properties.kcBodyClass!}">

         <div id="kc-header" class="${properties.kcHeaderClass!}">
            <div id="kc-header-wrapper" class="${properties.kcHeaderWrapperClass!} header-align">
               <div class = "logo">
                  <a href = "https://apurva.ai/"><img class="logo-size" src="${url.resourcesPath}/img/Apurva.aiWhiteLogo.png"/></a>
               </div>
               <div class="pd-title" style="display:none;">
                  <a class ="pd-a-title" href ="https://space.societalplatform.org/public/about">
                  <span>${msg("aboutUs")}</span></a>
                  <a class ="pd-a-title" href="https://space.societalplatform.org/public/collaborators">
                  <span>${msg("collaborators")}</span></a>
               </div>
        <div class="pd-title-responsive">
<div class="dropbtn icons btn-right showLeft" onclick="showDropdown()">

<img src ="${url.resourcesPath}/img/Vector.png" alt="menu icon">
</div>
<div id="myDropdown" class="dropdown-content" style="display:none;">
<a href="https://space.societalplatform.org/public/about">${msg("aboutUs")}</a>
<a href="https://space.societalplatform.org/public/collaborators">${msg("collaborators")}</a>

</div>

</div>
            </div>
         </div>
         <div class="${properties.kcLoginClass!}">
         <div class="body-image">
            <div class="${properties.kcFormCardClass!} ${properties.kcFormCardAccountClass!} image-div2" >
            <!-- <div class="close-icon">
            <a href="https://space.societalplatform.org/">
            <img src="${url.resourcesPath}/img/close.svg" ></a></div> -->
               <header class="${properties.kcFormHeaderClass!}">
                  <div id="kc-content">
                     <div class="flex-alignment-header">
                        <#if realm.internationalizationEnabled && locale.supported?size gt 1>
                        <div id="kc-locale">
                           <div id="kc-locale-wrapper" class="${properties.kcLocaleWrapperClass!}">
                              <div class="kc-dropdown" id="kc-locale-dropdown">
                                 <a href="#" id="kc-current-locale-link">${locale.current}</a>
                                 <ul>
                                    <#list locale.supported as l>
                                    <li class="kc-dropdown-item"><a href="${l.url}">${l.label}</a></li>
                                    </#list>
                                 </ul>
                              </div>
                           </div>
                        </div>
                        </#if>
                        <#if !(auth?has_content && auth.showUsername() && !auth.showResetCredentials())>
                        <#if displayRequiredFields>
                        <div class="${properties.kcContentWrapperClass!}">
                           <div class="${properties.kcLabelWrapperClass!} subtitle">
                              <span class="subtitle"><span class="required">*</span> ${msg("requiredFields")}</span>
                           </div>
                           <div class="col-md-10">
                              <div id="kc-page-title" class="signInHead"><#nested "header"></div>
                           </div>
                        </div>
                        <#else>
                        <div id="kc-page-title" class="signInHead"><#nested "header"></div>
                        </#if>
                        <#else>
                        <#if displayRequiredFields>
                        <div class="${properties.kcContentWrapperClass!}">
                           <div class="${properties.kcLabelWrapperClass!} subtitle">
                              <span class="subtitle"><span class="required">*</span> ${msg("requiredFields")}</span>
                           </div>
                           <div class="col-md-10">
                              <#nested "show-username">
                              <div class="${properties.kcFormGroupClass!}">
                                 <div id="kc-username">
                                    <label id="kc-attempted-username">${auth.attemptedUsername}
                                    </label>
                                    <a id="reset-login" href="${url.loginRestartFlowUrl}">
                                       <div class="kc-login-tooltip">
                                          <i class="${properties.kcResetFlowIcon!}"></i>
                                          <span class="kc-tooltip-text">${msg("restartLoginTooltip")}</span>
                                       </div>
                                    </a>
                                 </div>
                              </div>
                           </div>
                        </div>
                        <#else>
                        <#nested "show-username">
                        <div class="${properties.kcFormGroupClass!}">
                           <div id="kc-username">
                              <label id="kc-attempted-username">${auth.attemptedUsername}
                              </label>
                              <a id="reset-login" href="${url.loginRestartFlowUrl}">
                                 <div class="kc-login-tooltip">
                                    <i class="${properties.kcResetFlowIcon!}"></i>
                                    <span class="kc-tooltip-text">${msg("restartLoginTooltip")}</span>
                                 </div>
                              </a>
                           </div>
                        </div>
                        </#if>
                        </#if>
                     </div>
                  </div>
               </header>
               <div id="kc-content">
                  <div id="kc-content-wrapper">
                     <div class="flex-alignment">
                        <div class="column-2">
                           <#-- App-initiated actions should not see warning messages about the need to complete the action -->
                           <#-- during login. -->
                           <#if displayMessage && message?has_content && (message.type != 'warning' || !isAppInitiatedAction??)>
                           <div class="alert alert-${message.type}">
                              <#if message.type = 'success'><span class="${properties.kcFeedbackSuccessIcon!}"></span></#if>
                              <#if message.type = 'warning'><span class="${properties.kcFeedbackWarningIcon!}"></span></#if>
                              <#if message.type = 'error'><span class="${properties.kcFeedbackErrorIcon!}"></span></#if>
                              <#if message.type = 'info'><span class="${properties.kcFeedbackInfoIcon!}"></span></#if>
                              <span class="kc-feedback-text">${kcSanitize(message.summary)?no_esc}</span>
                           </div>
                           </#if>
                           <#nested "form">
                           <#if auth?has_content && auth.showTryAnotherWayLink() && showAnotherWayIfPresent>
                           <form id="kc-select-try-another-way-form" action="${url.loginAction}" method="post" <#if displayWide>class="${properties.kcContentWrapperClass!}"</#if>>
                           <div <#if displayWide>class="${properties.kcFormSocialAccountContentClass!} ${properties.kcFormSocialAccountClass!}"</#if>>
                           <div class="${properties.kcFormGroupClass!}">
                              <input type="hidden" name="tryAnotherWay" value="on" />
                              <a href="#" id="try-another-way" onclick="document.forms['kc-select-try-another-way-form'].submit();return false;">${msg("doTryAnotherWay")}</a>
                           </div>
                            
                        </div>
                        </form>
                        </#if>
                          
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
      </div>
      </div>
      </div>
      <div class="${properties.kcFooterWrapperClass!}">
         <div id="display-item">
                  <div class ="pink-bg"></div>
            <div class="footer-style" >
               <div class="col-1">
                  <div class="text-style">
                    <p>C4EC Foundation</p>
                    <p> No. 86, 7th Cross Road</p>
                     <p>4th ‘B’ Block, Koramangala</p>
                     <p>Bangalore - 560034</p>
                  </div>
               </div>
               <!-- <div class="col-2">
                <p><a class="text-style" name="helpAndContactButtonHomePage" i18n>Data
                  Privacy</a></p>
                 <p> <a class="text-style" name="helpAndContactButtonHomePage" i18n>Terms &
                  Conditions</a></p>
                  <p><a class="text-style"
                     name="helpAndContactButtonHomePage" i18n>Content
                  Policy and Community Guidelines</a></p>
                  <p><a  class="text-style" name="termOfUseButtonHomePage" i18n>License Policy</a>
                  </p>
                   <p><a class="text-style" name="termOfUseButtonHomePage" i18n>Asset
                  Guidelines</a></p>
               </div> -->
            </div>
         </div>
         <!-- <div id="display-responsive">
              <p > <a name="helpAndContactButtonHomePage" i18n>Data Privacy</a>   |
               </p>
               <p  ><a name="helpAndContactButtonHomePage" i18n>Terms & Conditions</a>   |
               </p>
               <p ><a name="termOfUseButtonHomePage" i18n>License Policy</a> 

               <p><a name="helpAndContactButtonHomePage" i18n>Content
               Policy & Community Guidelines</a> | </p>
               <p><a name="termOfUseButtonHomePage" i18n>Asset Guidelines</a> | </p>
               <p class="margin-bottom-p" ><a name="helpAndContactButtonHomePage" i18n>Contact Us</a></p>
         </div> -->
      </div>
   </body>
</html>
</#macro>