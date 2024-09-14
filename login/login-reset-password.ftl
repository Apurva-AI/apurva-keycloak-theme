<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=true; section>
    <#if section = "header">
    <div> 
        ${msg("emailForgotTitle")}
          </div>
        
            <div class = "mt-16 email-text">
        ${msg("emailInstruction")}
        </div> 
      
    <#elseif section = "form">
        <form id="kc-reset-password-form" class="${properties.kcFormClass!}" action="${url.loginAction}" method="post">
            <div class="${properties.kcFormGroupClass!}">
                <div class="${properties.kcLabelWrapperClass!}">
                    <label for="username" class="${properties.kcLabelClass!}"><#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if></label>
                    <span class="required">*</span>
                </div>
                <div class="${properties.kcInputWrapperClass!} fix-align-reset">
                    <#if auth?has_content && auth.showUsername()>
                        <input type="text" id="username" name="username" class="${properties.kcInputClass!}" autofocus value="${auth.attemptedUsername}"/>
                    <#else>
                        <input type="text" id="username" name="username" class="${properties.kcInputClass!}" autofocus/>
                    </#if>
                </div>
            </div>
            <div class="${properties.kcFormGroupClass!} ${properties.kcFormSettingClass!}">

                <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
                    <input class=" button ${properties.kcButtonClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}" type="submit" value="${msg("doSubmit")}"/>
                </div>
            </div>
        </form>
    <div id="kc-form-options" class="${properties.kcFormOptionsClass!} margin-backLogin">
                    <div class="${properties.kcFormOptionsWrapperClass!} mt-25">
                    
                        <span><a href="${url.loginUrl}" class=" font-login">
                        <img src= "${url.resourcesPath}/img/Shape.svg">${kcSanitize(msg("backToLogin"))?no_esc}</a></span>
                    </div>
                </div>

    </#if>
</@layout.registrationLayout>
