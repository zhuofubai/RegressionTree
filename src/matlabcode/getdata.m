function [temp]=getdata(index, outdata)
load(outdata);
temp=[time(index) actual_Back(index,:) actual_Front(index,:) actual_Needle_Tip_Position(index,:) actual_R(:,index)'... 
              ref_Back(index,:) ref_Front(index,:) ref_Needle_Tip_Position(index,:) ref_R(:,index)'...
             pos1(index) pos2(index) pos3(index) pos4(index) pos5(index)...
             torq1(index) torq2(index) torq3(index) torq4(index) torq5(index)...
             ones(length(index),1)*rinsert' ones(length(index),1)*insertdist ones(length(index),1)*pinsert];
clear outdata;