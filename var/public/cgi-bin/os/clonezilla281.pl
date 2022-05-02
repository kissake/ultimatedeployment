#!/usr/bin/perl

require "kickstart.pl";

sub clonezilla281_NewTemplate_2
{
 local($result)=&kickstart_NewTemplate_Finish("clonezilla281");
 return $result;
}

sub clonezilla281_WriteTemplatePXEMenu
{
  local($template)=shift;
  local($result)=&WriteTemplatePXEMenu($template);
  return 0;
}

sub clonezilla281_CopyTemplateFile
{
  local($template)=shift;
  local($destfile)=shift;
  local($result)=&kickstart_CopyTemplateFile($template,$destfile,"clonezilla281");
  return ($result);
}

sub clonezilla281_GetDefaultCommandLine
{
  local($template)=@_;
  local($commandline)="initrd=initrd.[OS].[FLAVOR] boot=live live-config union=overlay noswap noprompt vga=788 fetch=http://[UDA_IPADDR]/[OS]/[FLAVOR]/live/filesystem.squashfs";
  return $commandline;
}

sub clonezilla281_GetDefaultConfigFile1
{
  local($template)=@_;
  local($configfile)=&kickstart_GetDefaultConfigFile1($template);
  return $configfile;
}

sub clonezilla281_GetDefaultPublishFile
{
  local($template)=@_;
  local($publishfile)=&kickstart_GetDefaultPublishFile($template);
  return $publishfile;
}

sub clonezilla281_GetDefaultPublishDir
{
  local($template)=@_;
  local($publishdir)=&kickstart_GetDefaultPublishDir($template);
  return $publishdir;
}

sub clonezilla281_GetDefaultKernel
{
  local($template)=@_;
  local($kernel)="vmlinuz.[OS].[FLAVOR]";
  return $kernel;
}

sub clonezilla281_CreateTemplate
{
  local($result)=&kickstart_CreateTemplate("clonezilla281");
  return $result;
}

sub clonezilla281_CopyTemplate
{
  local($template,$desttemplate,%info)=@_;
  local($result)=&kickstart_CopyTemplate("clonezilla281",$template,$desttemplate,%info);
  return $result;
}

sub clonezilla281_DeleteTemplate
{
  local($template)=shift;
  local($result)=&kickstart_DeleteTemplate($template,"clonezilla281");
  return $result;
}

sub clonezilla281_ConfigureTemplate
{
  local($template,%config)=@_;
  local($result)=&kickstart_ConfigureTemplate("clonezilla281",$template,%config);
  return $result;
}

sub clonezilla281_ApplyConfigureTemplate
{
  local($template,%info)=@_;
  
  local($result)=&kickstart_ApplyConfigureTemplate("clonezilla281",$template,%info);
  return $result;
}

sub clonezilla281_NewOS_2
{
 local($result)=&kickstart_NewOS_2("clonezilla281");
 return result;
}

sub clonezilla281_ImportOS
{
 local($result)=&kickstart_ImportOS("clonezilla281");
  return $result;
}

sub clonezilla281_ImportOS_DoIt
{
  local($actionid)=shift;
  local($initrdlocation)="/live/initrd.img";
  local($kernellocation)="/live/vmlinuz";
  local($result)=&kickstart_ImportOS_DoIt("clonezilla281",$kernellocation,$initrdlocation,$actionid);
  return $result;
}

1;
