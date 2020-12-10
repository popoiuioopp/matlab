function result = pp9_bilinear(img, blocksize)
% Bilinear Scaling
% img: Input image as 2D matrix
% blocksize: Output image block size [x y]

    x = [0 blocksize(1)];
    y = [0 blocksize(2)];

    zz = size(img);
    
    % Complete result
    result = [];

    for ya = 1:2:zz(1) - 1

        % fucking stupid matlab function
        % generate overlapping vectors
        r1 = buffer(img(ya,:), 2, 1);
        r2 = buffer(img(ya+1,:), 2, 1);
        r1(:,1) = [];
        r2(:,1) = [];
        r3 = [r1; r2];
        sr3 = size(r3);

        % variable to store each constructed row
        row_out = [];

        for j = 1:sr3(2)

            % Get group of 4 points for interpolation
            c = r3(:,j);

            % Generate Z values
            T = [c(1) c(2); c(3) c(4)];
            za = [];

            % Calculated interpolated values
            for xx = linspace(x(1), x(2), blocksize(1))
                for yy = linspace(y(1), y(2), blocksize(2))
                    za(end+1) = interp2(x, y, T, xx, yy);
                end
            end

            % Not sure if it works with non-square block sizes or not

            za = reshape(za, [blocksize(1) blocksize(2)]);

            % Trim overlapping values

            if (j ~= 1)
                za(:,1) = [];
            end

            if (ya ~= 1)
                za(1,:) = [];
            end

            % Concatenate calculated values to output image

            row_out = [row_out za];

        end

        result = [result; row_out];

    end
end

