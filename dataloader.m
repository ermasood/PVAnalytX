

function [hrHLD,hrSG]=dataloader();
load('TimeDat.mat')
mrk='<*so'
CID=1
tr=find(TimeDat(:,1)==CID)
ID=tr(1)
len=length(tr);
FD=tr(length(tr));
YD=length(tr)/3;
Systeminfo=TimeDat(ID,2);
R=TimeDat(ID:FD,4:51);
CL=R(1:3:len,:);
HLD=R(2:3:len,:);
SG=R(3:3:len,:).*1.5;
minHLD=min(HLD);
maxHLD=max(HLD);
minSG=min(SG);
maxSG=max(SG);
rHLD=zeros(10000,48);
rSG=zeros(10000,48);
for lp=1:48
rHLD(:,lp) = (minHLD(lp) + (maxHLD(lp)-minHLD(lp))*rand(10000,1));
rSG(:,lp) = (minSG(lp) + (maxSG(lp)-minSG(lp))*rand(10000,1));
end
hrHLD=zeros(10000,24);
hrSG=zeros(10000,24);
for i=2:2:48
hrHLD(:,i/2)=(rHLD(:,i)./1800)+(rHLD(:,i-1)./1800);
hrSG(:,i/2)=(rSG(:,i)./1800)+(rSG(:,i-1)./1800);
end
hrHLD=hrHLD.*3600;
hrSG=hrSG.*3600;

