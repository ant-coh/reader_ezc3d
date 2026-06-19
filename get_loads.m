function [loads] = get_loads(c3d)

loads=struct();
labels=c3d.parameters.ANALOG.LABELS.DATA;
labels=strrep(labels,' ','');
labels=strrep(labels,'.','_');
for i=1:length(labels)
    if contains(labels{i},'Force') || contains(labels{i},'Moment')
        shortlabel=extractAfter(labels{i},"_");
        loads.(shortlabel)=c3d.data.analogs(:, i);
        if contains(labels{i},'Force') && ~isfield(loads,'unit_force')
            loads.unit_force=c3d.parameters.ANALOG.UNITS.DATA{i};
        elseif contains(labels{i},'Moment') && ~isfield(loads,'unit_moment')
            loads.unit_moment=c3d.parameters.ANALOG.UNITS.DATA{i};
        end
    end
end

end