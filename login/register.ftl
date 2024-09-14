<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "header">
   <div> ${msg("registerTitle")}</div>
        <div id="kc-form-options">
           <div class="${properties.kcFormOptionsWrapperClass!}">
            <span  class="text-login ">Already have an account? <a href="${url.loginUrl}" class ="fix-text-color">${kcSanitize(msg("backToLoginInRegister"))?no_esc}</a></span>
            </div>
        </div>
    <#elseif section = "form">
         <div>
        <form id="kc-register-form" class="${properties.kcFormClass!}" action="${url.registrationAction}" method="post">
            <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('firstName',properties.kcFormGroupErrorClass!)}">
                <div class="${properties.kcLabelWrapperClass!}">
                    <label for="firstName">${msg("firstName")}</label>
                    <span class="required">*</span>
                </div>
                <div class="${properties.kcInputWrapperClass!}">
                    <input type="text" id="firstName" class="${properties.kcInputClass!} " name="firstName" required value="${(register.formData.firstName!'')}" />
                </div>
            </div>

            <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('lastName',properties.kcFormGroupErrorClass!)}">
                <div class="${properties.kcLabelWrapperClass!}">
                    <label for="lastName" class="${properties.kcLabelClass!}">${msg("lastName")}</label>
                </div>
                <div class="${properties.kcInputWrapperClass!}">
                    <input type="text" id="lastName" class="${properties.kcInputClass!}" name="lastName" value="${(register.formData.lastName!'')}" />
                </div>
            </div>

            <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('email',properties.kcFormGroupErrorClass!)}">
                <div class="${properties.kcLabelWrapperClass!}">
                    <label for="email" class="${properties.kcLabelClass!}">${msg("email")}</label>
                      <span class="required">*</span>
                </div>
                <div class="${properties.kcInputWrapperClass!}">
                    <input type="text" id="email" required class="${properties.kcInputClass!}" name="email" value="${(register.formData.email!'')}" autocomplete="email" />
                </div>
            </div>
            <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('organisation',properties.kcFormGroupErrorClass!)}">
                <div class="${properties.kcLabelWrapperClass!}">
                    <label for="organisation" class="${properties.kcLabelClass!}">${msg("Organisation")}</label>
                      <span class="required">*</span>
                </div>
                <div class="${properties.kcInputWrapperClass!}">
                    <input type="text" id="organisation" required class="${properties.kcInputClass!}" name="user.attributes.organisation" value="" />
                </div>
            </div>
          <#if !realm.registrationEmailAsUsername>
            <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('username',properties.kcFormGroupErrorClass!)}">
                <div class="${properties.kcLabelWrapperClass!}">
                    <label for="username" class="${properties.kcLabelClass!}">${msg("username")}</label>
                </div>
                <div class="${properties.kcInputWrapperClass!}">
                    <input type="text" id="username"  class="${properties.kcInputClass!}" name="username" value="${(register.formData.username!'')}" autocomplete="username" />
                </div>
            </div>
          </#if>

            <#if passwordRequired??>
            <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('password',properties.kcFormGroupErrorClass!)}">
                <div class="${properties.kcLabelWrapperClass!}">
                    <label for="password"  class="${properties.kcLabelClass!}">${msg("password")}</label>
                      <span class="required">*</span>
                </div>
                <div class="${properties.kcInputWrapperClass!}" >
                    <input type="password" id="password" required class="${properties.kcInputClass!}" name="password" autocomplete="new-password"/>
                </div>
            </div>

            <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('password-confirm',properties.kcFormGroupErrorClass!)}">
                <div class="${properties.kcLabelWrapperClass!}">
                    <label for="password-confirm"  class="${properties.kcLabelClass!}">${msg("passwordConfirm")}</label>
                     <span class="required">*</span>
                </div>
                <div class="${properties.kcInputWrapperClass!}">
                    <input type="password" id="password-confirm"  required class="${properties.kcInputClass!}" name="password-confirm" />
                </div>
            </div>
            </#if>

            <#if recaptchaRequired??>
            <div class="form-group">
                <div class="${properties.kcInputWrapperClass!}">
                    <div class="g-recaptcha" data-size="compact" data-sitekey="${recaptchaSiteKey}"></div>
                </div>
            </div>
            </#if>

            <div class="${properties.kcFormGroupClass!} mt-40">
      <div id="kc-form-options" class="${properties.kcFormOptionsClass!} text-center">
                <div id="kc-form-buttons  ${properties.kcInputWrapperClass!}">
    
                    <input class="mt-36 ui fluid button ${properties.kcButtonClass!} ${properties.kcInputClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!} font-size-button" style="font-size:13px;" type="submit" value="${msg("doRegister")}"/>
                 
                </div>
                    </div>
                </div>
            </div>
        </form>
        </div>
    </#if>
</@layout.registrationLayout>
