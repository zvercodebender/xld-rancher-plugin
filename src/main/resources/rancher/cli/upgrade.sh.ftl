<#--

    Copyright 2017 XEBIALABS

    Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

-->
unzip ${deployed.file.path} -d .
<#if deployed.serviceNames?has_content>
  <#list deployed.serviceNames as serviceName>
    <@compress single_line=true>
${deployed.container.cliPath}
<#if deployed.container.url??>--url ${deployed.container.url} </#if>
<#if deployed.container.accessKey??>--access-key ${deployed.container.accessKey} </#if>
<#if deployed.container.secretKey??>--secret-key ${deployed.container.secretKey} </#if>
<#if deployed.container.config??>--config ${deployed.container.config} </#if>
<#if deployed.wait>--wait </#if>
<#if deployed.waitTimeout??>--wait-timeout ${deployed.waitTimeout} </#if>
<#if deployed.waitState??>--wait-state ${deployed.waitState} </#if>
up -d --upgrade
<#if deployed.forceUpgrade>--force-upgrade </#if>
<#if deployed.confirmUpgrade>--confirm-upgrade </#if>
--stack ${deployed.name} ${serviceName}
    </@compress>

  </#list>
<#else>
  <@compress single_line=true>
${deployed.container.cliPath}
<#if deployed.container.url??>--url ${deployed.container.url} </#if>
<#if deployed.container.accessKey??>--access-key ${deployed.container.accessKey} </#if>
<#if deployed.container.secretKey??>--secret-key ${deployed.container.secretKey} </#if>
<#if deployed.container.config??>--config ${deployed.container.config} </#if>
<#if deployed.wait>--wait </#if>
<#if deployed.waitTimeout??>--wait-timeout ${deployed.waitTimeout} </#if>
<#if deployed.waitState??>--wait-state ${deployed.waitState} </#if>
up -d --upgrade
<#if deployed.forceUpgrade>--force-upgrade </#if><#if deployed.confirmUpgrade>--confirm-upgrade </#if>
--stack ${deployed.name}
  </@compress>

</#if>
