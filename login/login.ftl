<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=social.displayInfo displayWide=(realm.password && social.providers??); section>
    <#if section = "header">
       <div>
       <p>${msg("doLogIn")}</p>
       </div>
        <div>
             <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
                <div id="kc-registration" class="border-color">
                    <span class="text-login">New user? <a tabindex="6" href="${url.registrationUrl}" class ="fix-text-color" >${msg("doRegister")}</a></span>
                 </div>
             </#if>
                   </div>
    <#elseif section = "form">
    <div id="kc-form" <#if realm.password && social.providers??>class="${properties.kcContentWrapperClass!}"</#if>>
      <div id="kc-form-wrapper">
        <#if realm.password>
            <form id="kc-form-login" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
                <div class="${properties.kcFormGroupClass!} pd-form">
                    <label for="username" class="${properties.kcLabelClass!}"><#if !realm.loginWithEmailAllowed>${msg("email")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if></label>   
                              <#if usernameEditDisabled??>
                        <input tabindex="1" id="username" class="${properties.kcInputClass!}" name="username" value="${(login.username!'')}" type="text" disabled />
                    <#else>
                        <input tabindex="1" id="username" class="${properties.kcInputClass!}" name="username" value="${(login.username!'')}"  type="text"  autocomplete="off" />
                    </#if>
                </div>
                <div class="${properties.kcFormGroupClass!}">
                    <div class="flex-pwd">
        
                    <label for="password" class="${properties.kcLabelClass!}">${msg("password")}</label>
     
                            <#if realm.resetPasswordAllowed>
                                <a tabindex="5" href="${url.loginResetCredentialsUrl}" class="forgot-pwd">${msg("doForgotPassword")}</a>
                            </#if>
                    </div>
                    
                <input tabindex="2" id="password" class="${properties.kcInputClass!}" name="password" type="password" autocomplete="off" />
                </div>

                <div class="${properties.kcFormGroupClass!} ${properties.kcFormSettingClass!}">
                    <div id="kc-form-options">
                        <#if realm.rememberMe && !usernameEditDisabled??>
                            <div class="checkbox">
                                <label>
                                    <#if login.rememberMe??>
                                        <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox" checked> ${msg("rememberMe")}
                                    <#else>
                                        <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox"> ${msg("rememberMe")}
                                    </#if>
                                </label>
                            </div>
                        </#if>
                        </div>
                    </div>
                 <div> 
                <div id="kc-form-buttons" class="${properties.kcFormGroupClass!}">
                        <div>     
                            <p><input tabindex="3" id="termsAndConditions" name="termsAndConditions" type="checkbox" checked onclick="handleCheckboxClick(this)">&nbsp;By signing in you are accepting to our <a class="hyper-link" href="https://apurva.ai/Apurva_Terms.pdf" target="_blank">Terms and conditions</a></p>
                        </div>
                      <input type="hidden" id="id-hidden-input" name="credentialId" <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if>/>
                      <input tabindex="4" class="mt-36 ui fluid button  ${properties.kcButtonClass!} ${properties.kcInputClass!}  ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}"  style="font-size:13px;" name="login" id="kc-login" type="submit" value="${msg("doLogIn")}"/>

                </div>
                <#if realm.password && social.providers??>

                     <div id="kc-social-providers">
                        <ul class= "${properties.kcFormSocialAccountListClass!} <#if social.providers?size gt 4>${properties.kcFormSocialAccountDoubleListClass!}</#if>">
                        <#list social.providers as p>
                         <#if p.providerId ==  "apple">
                    <li class="${properties.kcFormSocialAccountListLinkClass!}">
                    <div class = "border-container-apple">
                        <a href="${p.loginUrl}" id="zocial-${p.alias}" class="${p.providerId} apple-text" >
                        <span class="apple-img"></span> 
                        <span class="margin-apple">
                        Sign In with Apple
                    </span>
                        </a>
                        </div>
                    </li>
                    <#elseif p.providerId ==  "google">
                    <li class="${properties.kcFormSocialAccountListLinkClass!} mt-20">
                        <div class = "border-container">
                        <a href="${p.loginUrl}" id="zocial-${p.alias}" class="${p.providerId} google-text" >
                        <span class="google-img"></span> <span class="margin-google">Sign In with Google</span>
                        </a>
                        </div>
                        </li>
                    <#else>
                        <li class="${properties.kcFormSocialAccountListLinkClass!}"><a href="${p.loginUrl}" id="zocial-${p.alias}" class="zocial ${p.providerId} button-google button"  > <span>${p.displayName}</span></a></li>
                    </#if>     
                        </#list>
                        </ul>
                     </div>
        
                </#if>
               	
                <div>
            </form>
        </#if>
        </div>
      </div>
    </#if>
</@layout.registrationLayout>

