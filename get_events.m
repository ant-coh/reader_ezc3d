function [events] = get_events(c3d)

events=struct();
for i=1:c3d.parameters.EVENT.USED.DATA
    if ~strcmp(c3d.parameters.EVENT.LABELS.DATA{i},'Foot Strike') && ~strcmp(c3d.parameters.EVENT.LABELS.DATA{i},'Foot Off')
        continue
    end
    label=strrep(sprintf('%s_%s',c3d.parameters.EVENT.CONTEXTS.DATA{i},c3d.parameters.EVENT.LABELS.DATA{i}),' ','_');
    if ~isfield(events,label)
        events.(label)=[];
    end
    events.(label)(1,length(events.(label))+1)=c3d.parameters.EVENT.TIMES.DATA(2,i);
end

end