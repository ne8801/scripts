#Remediation

$policyFile =
@"
<AppLockerPolicy Version="1">
<RuleCollection Type="Dll" EnforcementMode="AuditOnly" >
<FilePathRule Id="86f235ad-3f7b-4121-bc95-ea8bde3a5db5" Name="Benign DENY Rule" Description="" UserOrGroupSid="S-1-1-0" Action="Deny">
<Conditions>
<FilePathCondition Path="%OSDRIVE%\ThisWillBeBlocked.dll" />
</Conditions>
</FilePathRule>
<RuleCollectionExtensions>
<ThresholdExtensions>
<Services EnforcementMode="Enabled" />
</ThresholdExtensions>
<RedstoneExtensions>
<SystemApps Allow="Enabled"/>
</RedstoneExtensions>
</RuleCollectionExtensions>
</RuleCollection>
<RuleCollection Type="Exe" EnforcementMode="AuditOnly">
<FilePathRule Id="9420c496-046d-45ab-bd0e-455b2649e41e" Name="Benign DENY Rule" Description="" UserOrGroupSid="S-1-1-0" Action="Deny">
<Conditions>
<FilePathCondition Path="%OSDRIVE%\ThisWillBeBlocked.exe" />
</Conditions>
</FilePathRule>
<RuleCollectionExtensions>
<ThresholdExtensions>
<Services EnforcementMode="Enabled" />
</ThresholdExtensions>
<RedstoneExtensions>
<SystemApps Allow="Enabled"/>
</RedstoneExtensions>
</RuleCollectionExtensions>
</RuleCollection>
<RuleCollection Type="ManagedInstaller" EnforcementMode="Enabled">
<FilePathRule Id="f1a34584-0719-4653-b805-b95089165c74" Name="%PROGRAMFILES%\MICROSOFT STUDIOS\MINECRAFT EDUCATION EDITION\MINECRAFTEDUCATIONUPDATER.EXE" Description="" UserOrGroupSid="S-1-1-0" Action="Allow">
<Conditions>
<FilePathCondition Path="%PROGRAMFILES%\MICROSOFT STUDIOS\MINECRAFT EDUCATION EDITION\MINECRAFTEDUCATIONUPDATER.EXE" />
</Conditions>
</FilePathRule>
<FilePublisherRule Id="0555c9fe-8ccd-4b7b-af30-ed1358f06e3d" Name="IBSAUTILS.EXE version 3.2.0.0 or greater in IBNET_CLIENT from O=IBOSS, INC., L=BOSTON, S=MASSACHUSETTS, C=US" Description="" UserOrGroupSid="S-1-1-0" Action="Allow">
<Conditions>
<FilePublisherCondition PublisherName="O=IBOSS, INC., L=BOSTON, S=MASSACHUSETTS, C=US" ProductName="*" BinaryName="IBSAUTILS.EXE">
<BinaryVersionRange LowSection="3.2.0.0" HighSection="*" />
</FilePublisherCondition>
</Conditions>
</FilePublisherRule>
<FilePublisherRule Id="b4a0a9e9-b99b-4b49-980a-21e784637b76" Name="IBSASERVICE.EXE version 5.4.30.0 or greater in IBMCV2-SERVICE from O=IBOSS, INC., L=BOSTON, S=MASSACHUSETTS, C=US" Description="" UserOrGroupSid="S-1-1-0" Action="Allow">
<Conditions>
<FilePublisherCondition PublisherName="O=IBOSS, INC., L=BOSTON, S=MASSACHUSETTS, C=US" ProductName="*" BinaryName="IBSASERVICE.EXE">
<BinaryVersionRange LowSection="5.4.30.0" HighSection="*" />
</FilePublisherCondition>
</Conditions>
</FilePublisherRule>
<FilePublisherRule Id="bbc3658e-6705-4400-96f6-559323eb1cdd" Name="OMADMCLIENT.EXE version 0.0.0.0 or greater in MICROSOFT® WINDOWS® OPERATING SYSTEM from O=MICROSOFT CORPORATION, L=REDMOND, S=WASHINGTON, C=US" Description="" UserOrGroupSid="S-1-1-0" Action="Allow">
<Conditions>
<FilePublisherCondition PublisherName="O=MICROSOFT CORPORATION, L=REDMOND, S=WASHINGTON, C=US" ProductName="*" BinaryName="OMADMCLIENT.EXE">
<BinaryVersionRange LowSection="*" HighSection="*" />
</FilePublisherCondition>
</Conditions>
</FilePublisherRule>
<FilePublisherRule Id="55932f09-04b8-44ec-8e2d-3fc736500c56" Name="MICROSOFT.MANAGEMENT.SERVICES.INTUNEWINDOWSAGENT.EXE version 1.39.200.2 or greater in MICROSOFTÃ‚Â® INTUNEÃ¢â€žÂ¢ from O=MICROSOFT CORPORATION, L=REDMOND, S=WASHINGTON, C=US" Description="" UserOrGroupSid="S-1-1-0" Action="Allow">
<Conditions>
<FilePublisherCondition PublisherName="O=MICROSOFT CORPORATION, L=REDMOND, S=WASHINGTON, C=US" ProductName="*" BinaryName="MICROSOFT.MANAGEMENT.SERVICES.INTUNEWINDOWSAGENT.EXE">
<BinaryVersionRange LowSection="1.39.200.2" HighSection="*" />
</FilePublisherCondition>
</Conditions>
</FilePublisherRule>
<FileHashRule Id="925c2347-799e-4248-bf76-dfbd67a74edd" Name="Testnav.exe" Description="" UserOrGroupSid="S-1-1-0" Action="Allow">
<Conditions><FileHashCondition>
<FileHash Type="SHA256" Data="0x92DA085B90CE1BB52131D7FC729D720D6F85C6D603425C699D2D7FDF1E5BE574" SourceFileName="Testnav.exe" SourceFileLength="98816" />
</FileHashCondition>
</Conditions>
</FileHashRule>
</RuleCollection>
</AppLockerPolicy>
"@

$policyFile | Out-File ./ApplockerMI.xml

Set-AppLockerPolicy -XmlPolicy .\ApplockerMI.xml -Merge -ErrorAction SilentlyContinue

appidtel.exe start -mionly
