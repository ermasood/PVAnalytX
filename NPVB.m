function [cptimp]=NPVB(hrHLD)   
   opt1=(1:7);
   st1=(8:14);
   pt=15:20;
   st2=(21:22);
   opt2=(23:24);
   phld= [(hrHLD(:,opt1).*3.5) (hrHLD(:,st1).*5.48) (hrHLD(:,pt).*23.5) (hrHLD(:,st2).*5.48) (hrHLD(:,opt2).*3.5)];
   cpimp=cumsum(phld')'/100;
   cptimp=cumsum(cpimp(:,24));


figure
    hold on
    yyaxis right
    plot(cptimp,'Linewidth',2)
    ylabel('Australian Dollars')
    ylim([0 11e4])
    yyaxis left
    y = cpimp(:,24); 
    x = 1:10000; 
    [p,S] = polyfit(x,y',1); 
    [y_fit,delta] = polyval(p,x,S);
    plot(x,y,'bo')
    hold on
     plot(x,y_fit,'k-')
%      plot(x,y_fit+2*delta,'k--',x,y_fit-2*delta,'k--')
     ylim([-5 25])
%      caption = sprintf('Savings = %f * day + %f', p(1), p(2));
%      text(40, 11, caption, 'FontSize', 16, 'Color', 'b', 'FontWeight', 'bold');
    ylabel('Australian Dollars')
    legend('Daily Cost of Energy Import (AUD)','Linear Fit','Accumulative Cost of Energy Import (AUD)','Location',['southeast'])
    title('Energy Import')
    xlabel('Time (Days)')
    set(gca,'FontSize',14)
 
   end

