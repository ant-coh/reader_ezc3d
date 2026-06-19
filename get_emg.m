function [emg] = get_emg(c3d)

emg=struct();
labels=c3d.parameters.ANALOG.LABELS.DATA;
labels=strrep(labels,' ','');
labels=strrep(labels,'.','_');
for i=1:length(labels)
    if contains(labels{i},'EMG')
        shortlabel=extractBefore(labels{i},"_");
        emg.(shortlabel)=c3d.data.analogs(:, i);
        if ~isfield(emg,'unit')
            emg.unit=c3d.parameters.ANALOG.UNITS.DATA{i};
        end
    end
end

end