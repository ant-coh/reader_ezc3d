function [angles] = get_angles(c3d)

angles=struct();
labels=c3d.parameters.POINT.LABELS.DATA;
for i=1:length(labels)
    if endsWith(labels{i},'Angles')
        angles.(labels{i})=squeeze(c3d.data.points(:,i,:))';
    end
end
angles.unit=c3d.parameters.POINT.ANGLE_UNITS.DATA{1};

end