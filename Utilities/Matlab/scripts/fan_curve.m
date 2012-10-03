% McDermott and Floyd
% 10-3-12
% fan_curve.m
%
% Makes figure for HVAC Fan Parameters section of the FDS Users Guide

close all
clear all

plot_style

vdot_max = 10;
dp_max = 500;

dp = -1000:1000;

vdot = vdot_max*sign(dp_max-dp).*sqrt(abs(dp-dp_max)/dp_max);

plot(vdot,dp,'k-','LineWidth',2)
set(gca,'Units',Plot_Units)
set(gca,'Position',[Plot_X,Plot_Y,Plot_Width,Plot_Height])
set(gca,'FontName',Font_Name)
set(gca,'FontSize',Title_Font_Size)
set(gca,'XGrid','on')
set(gca,'YGrid','on')
axis([-15 15 -1000 1000])
xlabel('Volume Flow Rate (m$^3$/s)','Interpreter',Font_Interpreter,'FontName',Font_Name,'FontSize',Label_Font_Size)
ylabel('Static Pressure (Pa)','Interpreter',Font_Interpreter,'FontName',Font_Name,'FontSize',Label_Font_Size)

% print to pdf
plot_dir = '../../Manuals/FDS_User_Guide/SCRIPT_FIGURES/';
set(gcf,'PaperUnits',Paper_Units);
set(gcf,'PaperSize',[Paper_Width Paper_Height]);
set(gcf,'PaperPosition',[0 0 Paper_Width Paper_Height]);
print(gcf,'-dpdf',[plot_dir,'fan_curve'])