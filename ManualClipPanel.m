function ManualClipPanel()
    clear, close all,clc;


	%---Main Layout of the Main Panel
	hFigureBase = figure('Name', 'Rawdata showing...', ...
						 'Units', 'normalized', ...
						 'Position', [0 0 1 0.9], ...
                         'MenuBar', 'none', ...
                         'ToolBar', 'none', ...
                         'NumberTitle', 'off');
	maximize(hFigureBase);
    hButton_AddFile = uicontrol('Parent', hFigureBase, ...
                                'Style', 'PushButton', ...
                                'String', 'AddFile+...', ...
                                'FontSize', 14, ...
                                'Units', 'normalized', ...
                                'Position', [0.9 0.9 0.06 0.04], ...
                                'Callback', @Button_AddFile_CallBack);
    hEdit_FileName = uicontrol('Parent', hFigureBase, ...
                               'Style', 'edit', ...
                               'FontSize', 13, ...
                               'Units', 'normalized', ...
                               'Position', [0.87 0.87 0.12 0.03]);

    % Panel: Whole-Left-Right-Up-Down
    hPanelWhole = uipanel('Parent', hFigureBase, ...
                          'Title', 'Whole', ...
                          'Units', 'normalized', ...
                          'Position', [0.01 0.01 0.85 0.98]);
	hPanelLeft = uipanel('Parent', hFigureBase, ...
						'Title', 'Left', ...
						'Units', 'normalized', ...
						'Position', [0.01 0.01 0.45 0.98], ...
                        'Visible', 'off');
    hPanelRight = uipanel('Parent', hFigureBase, ...
                          'Title', 'Right', ...
                          'Units', 'normalized', ...
                          'Position', [0.45 0.01 0.4 0.98], ...
                          'Visible', 'off');
    hPanelUp = uipanel('Parent', hFigureBase, ...
                       'Title', 'Up', ...
                       'Units', 'normalized', ...
                       'Position', [0.01 0.5 0.99 0.5], ...
                       'Visible', 'off');
    hPanelDown = uipanel('Parent', hFigureBase, ...
                         'Title', 'Down', ...
                         'Units', 'normalized', ...
                         'Position', [0.01 0.01 0.99 0.49], ...
                         'Visible', 'off');

	hButton_AddClipped = uicontrol('Parent', hFigureBase, ...
									'Style', 'pushbutton', ...
									'Units', 'normalized', ...
									'Position', [0.86 0.66 0.03 0.02], ...
									'FontSize', 10, ...
									'String', 'Add+', ...
									'CallBack', {@Button_AddClipped_CallBack}, ...
									'Enable', 'on');
                                

    % Add Clipped Lines
	Total_Clipped = 8;
	MP_handles.Total_Clipped = Total_Clipped;
	%--Left
	hButton_LeftMinus = zeros(Total_Clipped, 1);
	hEdit_Left = zeros(Total_Clipped, 1);
	hButton_LeftPlus = zeros(Total_Clipped, 1);
	%--Right
	hButton_RightMinus = zeros(Total_Clipped, 1);
	hEdit_Right = zeros(Total_Clipped, 1);
	hButton_RightPlus = zeros(Total_Clipped, 1);
	for n=1:Total_Clipped
		%--Left
		hButton_LeftMinus(n) = uicontrol('Parent', hFigureBase, ...
										 'Style', 'pushbutton', ...
										 'Units', 'normalized', ...
										 'FontSize', 14, ...
										 'String', '-', ...
										 'Position', [0.85 0.63-(n-1)*0.023 0.02 0.02], ...
										 'CallBack', {@Button_Minus_CallBack,n,'L'}, ...
										 'Visible', 'off');
		hEdit_Left(n) = uicontrol('Parent', hFigureBase, ...
								  'Style', 'Edit', ...
								  'Units', 'normalized', ...
								  'FontSize', 10, ...
								  'Position', [0.872, 0.63-(n-1)*0.023 0.026 0.02], ...
								  'String', '20000', ...
								  'CallBack', {@Edit_CallBack,n,'L'}, ...
								  'Visible', 'off');
		hButton_LeftPlus(n) = uicontrol('Parent', hFigureBase, ...
										'Style', 'pushbutton', ...
										'Units', 'normalized', ...
										'Position', [0.90 0.63-(n-1)*0.023 0.02 0.02], ...
										'FontSize', 14, ...
										'String', '+', ...
										'CallBack', {@Button_Plus_CallBack,n,'L'}, ...
										'Visible', 'off');
		hButton_RightMinus(n) = uicontrol('Parent', hFigureBase, ...
										'Style', 'pushbutton', ...
										'Units', 'normalized', ...
										'Position', [0.921 0.63-(n-1)*0.023 0.02 0.02], ...
										'FontSize', 14, ...
										'String', '-', ...
										'CallBack', {@Button_Minus_CallBack,n,'R'}, ...
										'Visible', 'off');
		hEdit_Right(n) = uicontrol('Parent', hFigureBase, ...
								   'Style', 'Edit', ...
								   'Units', 'normalized', ...
								   'FontSize', 10, ...
								   'Position', [0.942 0.63-(n-1)*0.023 0.026 0.02 ], ...
								   'String', '30000', ...
								   'CallBack', {@Edit_CallBack,n,'R'}, ...
								   'Visible', 'off');
		hButton_RightPlus(n) = uicontrol('Parent', hFigureBase, ...
										'Style', 'pushbutton', ...
										'Units', 'normalized', ...
										'Position', [0.97 0.63-(n-1)*0.023 0.02 0.02], ...
										'FontSize', 14, ...
										'String', '+', ...
										'CallBack', {@Button_Plus_CallBack,n,'R'}, ...
										'Visible', 'off');
	end

	hButton_Truncate = uicontrol('Parent', hFigureBase, ...
							   'Style', 'pushbutton', ...
							   'Units', 'normalized', ...
							   'FontSize', 10, ...
							   'Position', [0.86 0.46 0.06 0.04 ], ...
							   'String', 'Truncate', ...
							   'CallBack', @Button_Truncate_CallBack);


    
    %  --- handles out
    % File Read
    handles.hFigureBase = hFigureBase;
    handles.hButton_AddFile = hButton_AddFile;
    handles.hEdit_FileName = hEdit_FileName;
    % Panel: Left-Right-Up-Down
    handles.hPanelWhole = hPanelWhole;
    handles.hPanelLeft = hPanelLeft;
    handles.hPanelRight = hPanelRight;
    handles.hPanelUp = hPanelUp;
    handles.hPanelDown = hPanelDown;
    
    % Clipping lines
    handles.hButton_AddClipped = hButton_AddClipped;
    
    % Truncating
    handles.hButton_Truncate = hButton_Truncate;
    
    
    guidata(hFigureBase, handles);
    if nargout
        varargout{1} = hFigureBase;
    end


%------------------------CallBack of Buttons.

function Button_AddFile_CallBack(source, eventdata)
    handles = guidata(source);
    [FileName, PathName] = uigetfile({'*.csv';'*.*'},'Raw data loading ...');
    set(handles.hEdit_FileName, 'String', FileName);
    %how many axes are needed for selected Rawdata file;
    rawdata = csvread([PathName, FileName], 1, 0);
    %[t, ch1, t, ch2, t, ch3, t, ch4, ...]710000x12
    Channel_Counts = size(rawdata,2);

% 	Channel_Values = [1 2 3 4 1 2 3 4];
% 	hAxes_EMG = zeros(Channel_Counts,1);
% 	hPlots_EMG =zeros(Channel_Counts,1);
% 	%Left four axes
% 	for ch=1:Channel_Counts/2
% 		hAxes_EMG(ch) = axes('Parent', hPanelLeft, ...
% 							 'Units', 'normalized', ...
% 							 'Position', [0.02 1-0.23*ch, 0.47, 0.18], ...
% 							 'YGrid', 'on', ...
% 							 'XGrid', 'on', ...
% 							 'YLimMode', 'manual');
% 		set(hAxes_EMG(ch), 'Color', [0.15 0.15 0.15]);
% 		%set(hAxes_EMG(ch), 'YLim', [-0.005 0.005]);
% 		hPlots_EMG(ch) = plot(hAxes_EMG(ch), 0, '-y', ...
% 							 'LineWidth',1);
% 		title(['Channel', num2str(Channel_Values(ch))]);
% 	end
% 	%Right four axes
% 	for ch=Channel_Counts/2+1:Channel_Counts
% 		hAxes_EMG(ch) = axes('Parent', hPanelLeft, ...
% 							 'Units', 'normalized', ...
% 							 'Position', [0.51 1-0.23*(ch-4), 0.47, 0.18], ...
% 							 'YGrid', 'on', ...
% 							 'XGrid', 'on', ...
% 							 'YLimMode', 'manual');
% 		set(hAxes_EMG(ch), 'Color', [0.15 0.15 0.15]);
% 		%set(hAxes_EMG(ch), 'YLim', [-0.005 0.005]);
% 		hPlots_EMG(ch) = plot(hAxes_EMG(ch), 0, '-y', ...
% 							 'LineWidth',1);
% 		title(['Channel', num2str(Channel_Values(ch))]);
%     end
% %-Add Clipped Line.
function Button_AddClipped_CallBack(source, eventdata)
	global MP_handles;
	%--Update Add_Number
	MP_handles.Add_Number = MP_handles.Add_Number + 1;
	%--Visible 
	%-the Number_th Clipped left line 
	%-the Edit box.
	%-the Clipped right line.
	%-Left
	set(MP_handles.hButton_LeftMinus(MP_handles.Add_Number), 'Visible', 'on');
	set(MP_handles.hEdit_Left(MP_handles.Add_Number), 'Visible', 'on');
	set(MP_handles.hButton_LeftPlus(MP_handles.Add_Number), 'Visible', 'on');
	%-Right
	set(MP_handles.hButton_RightMinus(MP_handles.Add_Number), 'Visible', 'on');
	set(MP_handles.hEdit_Right(MP_handles.Add_Number), 'Visible', 'on');
	set(MP_handles.hButton_RightPlus(MP_handles.Add_Number), 'Visible', 'on');

	%--Initiate the Position of Clipped Line.
	% XLim = MP_handles.Rawdata_Size(1);
	XLim = get(MP_handles.hAxes_EMG(1), 'XLim');
	XLim = XLim(2);
	ClippedLine_Position = [XLim/MP_handles.Total_Clipped*MP_handles.Add_Number-2000, ...
							XLim/MP_handles.Total_Clipped*MP_handles.Add_Number+2000];
	set(MP_handles.hEdit_Left(MP_handles.Add_Number), 'String', num2str(ClippedLine_Position(1)));
	set(MP_handles.hEdit_Right(MP_handles.Add_Number), 'String', num2str(ClippedLine_Position(2)));

	%--Clipped line initiation.
	global Clipped_Line;
	Color_map = {'m','k','r','g','c'};
	for ch=1:MP_handles.Channel_Counts
		Clipped_Line(2*MP_handles.Add_Number-1,ch) = line([ClippedLine_Position(1),ClippedLine_Position(1)], ...
														  [-0.0005 0.0005], ...
														 'Color', Color_map{MP_handles.Add_Number}, ...
														 'LineWidth', 1, ...
														 'Parent', MP_handles.hAxes_EMG(ch));
		Clipped_Line(2*MP_handles.Add_Number,ch) = line([ClippedLine_Position(2),ClippedLine_Position(2)], ...
														 [-0.0005 0.0005], ...
														 'Color', Color_map{MP_handles.Add_Number}, ...
														 'LineWidth', 1, ...
														 'Parent', MP_handles.hAxes_EMG(ch));
	end
	
function Button_Minus_CallBack(source, eventdata, number, Left_Right)
	global MP_handles;
	global Clipped_Line;

	Color_map = {'m','k','r','g','c'};
	XLim = get(MP_handles.hAxes_EMG(1), 'XLim');
	%-[0 60000]
	YLim = get(MP_handles.hAxes_EMG(1), 'YLim');
	%-[-0.0005 0.0005]

	switch Left_Right
		case 'L'
			%--delete the older clipped line.
			delete(Clipped_Line(2*number-1,:));
		
			Current_Value = get(MP_handles.hEdit_Left(number), 'String');
			Current_Value = str2num(Current_Value);
			Current_Value = Current_Value -50;
			Current_Value = num2str(Current_Value);
			set(MP_handles.hEdit_Left(number), 'String', Current_Value)
			%-Left
			for ch=1:MP_handles.Channel_Counts
				Clipped_Line(2*number-1,ch) = line([str2num(get(MP_handles.hEdit_Left(number), 'String')), ...
												 str2num(get(MP_handles.hEdit_Left(number), 'String'))], ...
												 YLim, ...
												 'Color', Color_map{number}, ...
												 'LineWidth', 1, ...
												 'Parent', MP_handles.hAxes_EMG(ch));
			end
			
		case 'R'
			%--delete the older clipped line.
			delete(Clipped_Line(2*number,:));

			Current_Value = get(MP_handles.hEdit_Right(number), 'String');
			Current_Value = str2num(Current_Value);
			Current_Value = Current_Value - 50;
			Current_Value = num2str(Current_Value);
			set(MP_handles.hEdit_Right(number), 'String', Current_Value)
			%-Right
			for ch=1:MP_handles.Channel_Counts
				Clipped_Line(2*number,ch) = line([str2num(get(MP_handles.hEdit_Right(number), 'String')), ...
												 str2num(get(MP_handles.hEdit_Right(number), 'String'))], ...
												 YLim, ...
												 'Color', Color_map{number}, ...
												 'LineWidth', 1, ...
												 'Parent', MP_handles.hAxes_EMG(ch));
			end
	end

function Edit_CallBack(source, eventdata, number, Left_Right)
	global MP_handles;
	global Clipped_Line;

	XLim = get(MP_handles.hAxes_EMG(1), 'XLim');
	%-[0 60000]
	YLim = get(MP_handles.hAxes_EMG(1), 'YLim');
	%-[-0.0005 0.0005]

	Color_map = {'m','k','r','g','c'};

	switch Left_Right
		case 'L'
			%--delete the older clipped line.
			delete(Clipped_Line(2*number-1,:));

			%-Left
			for ch=1:MP_handles.Channel_Counts
				Clipped_Line(2*number-1,ch) = line([str2num(get(MP_handles.hEdit_Left(number), 'String')), ...
												 str2num(get(MP_handles.hEdit_Left(number), 'String'))], ...
												 YLim, ...
												 'Color', Color_map{number}, ...
												 'LineWidth', 1, ...
												 'Parent', MP_handles.hAxes_EMG(ch));
			end
		case 'R'
			%--delete the older clipped line.
			delete(Clipped_Line(2*number,:));

			%-Right
			for ch=1:MP_handles.Channel_Counts
				Clipped_Line(2*number,ch) = line([str2num(get(MP_handles.hEdit_Right(number), 'String')), ...
												 str2num(get(MP_handles.hEdit_Right(number), 'String'))], ...
												 YLim, ...
												 'Color', Color_map{number}, ...
												 'LineWidth', 1, ...
												 'Parent', MP_handles.hAxes_EMG(ch));
			end
	end

function Button_Plus_CallBack(source, eventdata, number, Left_Right)
	global MP_handles;
	global Clipped_Line;

	XLim = get(MP_handles.hAxes_EMG(1), 'XLim');
	%-[0 60000]
	YLim = get(MP_handles.hAxes_EMG(1), 'YLim');
	%-[-0.0005 0.0005]

	Color_map = {'m','k','r','g','c'};

	switch Left_Right
		case 'L'
			%--delete the older clipped line.
			delete(Clipped_Line(2*number-1,:));

			Current_Value = get(MP_handles.hEdit_Left(number), 'String');
			Current_Value = str2num(Current_Value);
			Current_Value = Current_Value + 50;
			Current_Value = num2str(Current_Value);
			set(MP_handles.hEdit_Left(number), 'String', Current_Value)
			%-Left
			for ch=1:MP_handles.Channel_Counts
				Clipped_Line(2*number-1,ch) = line([str2num(get(MP_handles.hEdit_Left(number), 'String')), ...
												 str2num(get(MP_handles.hEdit_Left(number), 'String'))], ...
												 YLim, ...
												 'Color', Color_map{number}, ...
												 'LineWidth', 1, ...
												 'Parent', MP_handles.hAxes_EMG(ch));
			end
		case 'R'
			%--delete the older clipped line.
			delete(Clipped_Line(2*number,:));

			Current_Value = get(MP_handles.hEdit_Right(number), 'String');
			Current_Value = str2num(Current_Value);
			Current_Value = Current_Value + 50;
			Current_Value = num2str(Current_Value);
			set(MP_handles.hEdit_Right(number), 'String', Current_Value)
			%-Right
			for ch=1:MP_handles.Channel_Counts
				Clipped_Line(2*number,ch) = line([str2num(get(MP_handles.hEdit_Right(number), 'String')), ...
												 str2num(get(MP_handles.hEdit_Right(number), 'String'))], ...
												 YLim, ...
												 'Color', Color_map{number}, ...
												 'LineWidth', 1, ...
												 'Parent', MP_handles.hAxes_EMG(ch));
			end
	end


function Button_Truncate_CallBack(source, eventdata)
	global MP_handles;

	% Data{x, x, x, x, x}
	%1, MP_handles.Times
	%2, MP_handles.BA_Value
	%3, 1Healthy[1 2 3 4], 
	%   2Disease[5 6 7 8],
	%4, MP_handles.Movement_Value
	%5, Main_Channel

	%--Get only three Clipped Lines.
	%-One
	for CL=1:3
		Position_Line(CL, 1) = str2num(get(MP_handles.hEdit_Left(CL), 'String'));
		Position_Line(CL, 2) = str2num(get(MP_handles.hEdit_Right(CL), 'String'));
	end
	%---Rawdata
	%--60000x8
	%--Healthy Parts.
	for ch=1:4
		MP_handles.Data{MP_handles.Times_Value, MP_handles.BA_Value, 1, MP_handles.Movement_Value, ch} ...
					   = [MP_handles.Rawdata(Position_Line(1,1):Position_Line(1,2), ch+4); ...
					      MP_handles.Rawdata(Position_Line(2,1):Position_Line(2,2), ch+4); ...
					      MP_handles.Rawdata(Position_Line(3,1):Position_Line(3,2), ch+4)];
	end

	%--Disease Parts
	for ch=1:4
		MP_handles.Data{MP_handles.Times_Value, MP_handles.BA_Value, 2, MP_handles.Movement_Value, ch} ...
						= [MP_handles.Rawdata(Position_Line(1,1):Position_Line(1,2), ch); ...
						   MP_handles.Rawdata(Position_Line(2,1):Position_Line(2,2), ch); ...
						   MP_handles.Rawdata(Position_Line(3,1):Position_Line(3,2), ch)];
	end

	BA_Cell = {'Before', 'After'};
	Movement_Cell = {'RE', 'CB', 'PT', 'GN', 'NW'};
	%				   1	 2 	   3	 4	   5
	disp(['Truncate ', MP_handles.PatientName, ...
		  '_', num2str(MP_handles.Times_Value), ...
		  '_', BA_Cell{MP_handles.BA_Value}, ...
		  '_', Movement_Cell{MP_handles.Movement_Value}]);
	%--save Data to the .mat file.
	Data = MP_handles.Data;
	save([MP_handles.PatientName, '.mat'], ...
		 'Data');
	
	%--Comparison and Checking.
	% figure(2)
	% for ch=1:4
	% 	%-Left Disease.
	% 	subplot(4,2,2*ch-1);
	% 	plot(MP_handles.Data{MP_handles.Times_Value, MP_handles.BA_Value, 2, MP_handles.Movement_Value, ch});
	% 	%-Right Healthy.
	% 	subplot(4,2,2*ch);
	% 	plot(MP_handles.Data{MP_handles.Times_Value, MP_handles.BA_Value, 1, MP_handles.Movement_Value, ch});
	% end
