function [kinetics] = get_kinetics(c3d)

kinetics=struct();

labels=c3d.parameters.POINT.LABELS.DATA;
for i=1:length(labels)
    if contains(labels{i},'Force')
        kinetics.Forces.(labels{i})=squeeze(c3d.data.points(:,i,:))';
    elseif contains(labels{i},'Moment')
        kinetics.Moments.(labels{i})=squeeze(c3d.data.points(:,i,:))';
    elseif contains(labels{i},'Power')
        kinetics.Powers.(labels{i})=squeeze(c3d.data.points(:,i,:))';
    end
end
kinetics.Forces.unit=c3d.parameters.POINT.FORCE_UNITS.DATA{1};
kinetics.Moments.unit=c3d.parameters.POINT.MOMENT_UNITS.DATA{1};
kinetics.Powers.unit=c3d.parameters.POINT.POWER_UNITS.DATA{1};

end