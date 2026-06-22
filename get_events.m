function [events] = get_events(c3d)

events=struct();

for i=1:c3d.parameters.EVENT.USED.DATA
    idx=floor((i-1)/255)+1;
    if idx==1
        suffix='';
    else
        suffix=num2str(idx);
    end
    labels_field=['LABELS' suffix];
    contexts_field=['CONTEXTS' suffix];
    times_field=['TIMES' suffix];

    local_i=mod(i-1,255)+1;
    current_label=c3d.parameters.EVENT.(labels_field).DATA{local_i};
    current_context=c3d.parameters.EVENT.(contexts_field).DATA{local_i};
    current_time=c3d.parameters.EVENT.(times_field).DATA(2,local_i)+c3d.parameters.EVENT.(times_field).DATA(1,local_i)*60;

    if ~strcmp(current_label,'Foot Strike') && ~strcmp(current_label,'Foot Off')
        continue
    end
    label=strrep(sprintf('%s_%s',current_context,current_label),' ','_');
    if ~isfield(events,label)
        events.(label)=[];
    end
    events.(label)(1,end+1)=current_time;
end

end