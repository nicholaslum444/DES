; ModuleID = 'run_des.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.key_set = type { [8 x i8], [4 x i8], [4 x i8] }

@.str = private unnamed_addr constant [69 x i8] c"You must provide at least 1 parameter, where you specify the action.\00", align 1
@.str1 = private unnamed_addr constant [3 x i8] c"-g\00", align 1
@.str2 = private unnamed_addr constant [64 x i8] c"Invalid # of parameter specified. Usage: run_des -g keyfile.key\00", align 1
@.str3 = private unnamed_addr constant [3 x i8] c"wb\00", align 1
@key_file = internal global %struct._IO_FILE* null, align 8
@.str4 = private unnamed_addr constant [34 x i8] c"Could not open file to write key.\00", align 1
@.str5 = private unnamed_addr constant [34 x i8] c"Error writing key to output file.\00", align 1
@.str6 = private unnamed_addr constant [3 x i8] c"-e\00", align 1
@.str7 = private unnamed_addr constant [3 x i8] c"-d\00", align 1
@.str8 = private unnamed_addr constant [98 x i8] c"Invalid # of parameters (%d) specified. Usage: run_des [-e|-d] keyfile.key input.file output.file\00", align 1
@.str9 = private unnamed_addr constant [3 x i8] c"rb\00", align 1
@.str10 = private unnamed_addr constant [37 x i8] c"Could not open key file to read key.\00", align 1
@.str11 = private unnamed_addr constant [53 x i8] c"Key read from key file does nto have valid key size.\00", align 1
@input_file = internal global %struct._IO_FILE* null, align 8
@.str12 = private unnamed_addr constant [40 x i8] c"Could not open input file to read data.\00", align 1
@output_file = internal global %struct._IO_FILE* null, align 8
@.str13 = private unnamed_addr constant [42 x i8] c"Could not open output file to write data.\00", align 1
@.str14 = private unnamed_addr constant [14 x i8] c"Encrypting..\0A\00", align 1
@.str15 = private unnamed_addr constant [14 x i8] c"Decrypting..\0A\00", align 1
@.str16 = private unnamed_addr constant [50 x i8] c"Finished processing %s. Time taken: %lf seconds.\0A\00", align 1
@.str17 = private unnamed_addr constant [62 x i8] c"Invalid action: %s. First parameter must be [ -g | -e | -d ].\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %start = alloca i64, align 8
  %finish = alloca i64, align 8
  %time_taken = alloca double, align 8
  %file_size = alloca i64, align 8
  %padding = alloca i16, align 2
  %iseed = alloca i32, align 4
  %bytes_written = alloca i16, align 2
  %des_key = alloca i8*, align 8
  %bytes_read = alloca i16, align 2
  %des_key1 = alloca i8*, align 8
  %bytes_written2 = alloca i16, align 2
  %process_mode = alloca i16, align 2
  %block_count = alloca i64, align 8
  %number_of_blocks = alloca i64, align 8
  %data_block = alloca i8*, align 8
  %processed_block = alloca i8*, align 8
  %key_sets = alloca %struct.key_set*, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = load i32* %2, align 4
  %5 = icmp slt i32 %4, 2
  br i1 %5, label %6, label %8

; <label>:6                                       ; preds = %0
  %7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([69 x i8]* @.str, i32 0, i32 0))
  store i32 1, i32* %1
  br label %276

; <label>:8                                       ; preds = %0
  %9 = load i8*** %3, align 8
  %10 = getelementptr inbounds i8** %9, i64 1
  %11 = load i8** %10, align 8
  %12 = call i32 @strcmp(i8* %11, i8* getelementptr inbounds ([3 x i8]* @.str1, i32 0, i32 0)) #5
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %50

; <label>:14                                      ; preds = %8
  %15 = load i32* %2, align 4
  %16 = icmp ne i32 %15, 3
  br i1 %16, label %17, label %19

; <label>:17                                      ; preds = %14
  %18 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([64 x i8]* @.str2, i32 0, i32 0))
  store i32 1, i32* %1
  br label %276

; <label>:19                                      ; preds = %14
  %20 = load i8*** %3, align 8
  %21 = getelementptr inbounds i8** %20, i64 2
  %22 = load i8** %21, align 8
  %23 = call %struct._IO_FILE* @fopen(i8* %22, i8* getelementptr inbounds ([3 x i8]* @.str3, i32 0, i32 0))
  store %struct._IO_FILE* %23, %struct._IO_FILE** @key_file, align 8
  %24 = load %struct._IO_FILE** @key_file, align 8
  %25 = icmp ne %struct._IO_FILE* %24, null
  br i1 %25, label %28, label %26

; <label>:26                                      ; preds = %19
  %27 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([34 x i8]* @.str4, i32 0, i32 0))
  store i32 1, i32* %1
  br label %276

; <label>:28                                      ; preds = %19
  %29 = call i64 @time(i64* null) #4
  %30 = trunc i64 %29 to i32
  store i32 %30, i32* %iseed, align 4
  %31 = load i32* %iseed, align 4
  call void @srand(i32 %31) #4
  %32 = call noalias i8* @malloc(i64 8) #4
  store i8* %32, i8** %des_key, align 8
  %33 = load i8** %des_key, align 8
  call void @generate_key(i8* %33)
  %34 = load i8** %des_key, align 8
  %35 = load %struct._IO_FILE** @key_file, align 8
  %36 = call i64 @fwrite(i8* %34, i64 1, i64 8, %struct._IO_FILE* %35)
  %37 = trunc i64 %36 to i16
  store i16 %37, i16* %bytes_written, align 2
  %38 = load i16* %bytes_written, align 2
  %39 = sext i16 %38 to i32
  %40 = icmp ne i32 %39, 8
  br i1 %40, label %41, label %46

; <label>:41                                      ; preds = %28
  %42 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([34 x i8]* @.str5, i32 0, i32 0))
  %43 = load %struct._IO_FILE** @key_file, align 8
  %44 = call i32 @fclose(%struct._IO_FILE* %43)
  %45 = load i8** %des_key, align 8
  call void @free(i8* %45) #4
  store i32 1, i32* %1
  br label %276

; <label>:46                                      ; preds = %28
  %47 = load i8** %des_key, align 8
  call void @free(i8* %47) #4
  %48 = load %struct._IO_FILE** @key_file, align 8
  %49 = call i32 @fclose(%struct._IO_FILE* %48)
  br label %275

; <label>:50                                      ; preds = %8
  %51 = load i8*** %3, align 8
  %52 = getelementptr inbounds i8** %51, i64 1
  %53 = load i8** %52, align 8
  %54 = call i32 @strcmp(i8* %53, i8* getelementptr inbounds ([3 x i8]* @.str6, i32 0, i32 0)) #5
  %55 = icmp eq i32 %54, 0
  br i1 %55, label %62, label %56

; <label>:56                                      ; preds = %50
  %57 = load i8*** %3, align 8
  %58 = getelementptr inbounds i8** %57, i64 1
  %59 = load i8** %58, align 8
  %60 = call i32 @strcmp(i8* %59, i8* getelementptr inbounds ([3 x i8]* @.str7, i32 0, i32 0)) #5
  %61 = icmp eq i32 %60, 0
  br i1 %61, label %62, label %270

; <label>:62                                      ; preds = %56, %50
  %63 = load i32* %2, align 4
  %64 = icmp ne i32 %63, 5
  br i1 %64, label %65, label %68

; <label>:65                                      ; preds = %62
  %66 = load i32* %2, align 4
  %67 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([98 x i8]* @.str8, i32 0, i32 0), i32 %66)
  store i32 1, i32* %1
  br label %276

; <label>:68                                      ; preds = %62
  %69 = load i8*** %3, align 8
  %70 = getelementptr inbounds i8** %69, i64 2
  %71 = load i8** %70, align 8
  %72 = call %struct._IO_FILE* @fopen(i8* %71, i8* getelementptr inbounds ([3 x i8]* @.str9, i32 0, i32 0))
  store %struct._IO_FILE* %72, %struct._IO_FILE** @key_file, align 8
  %73 = load %struct._IO_FILE** @key_file, align 8
  %74 = icmp ne %struct._IO_FILE* %73, null
  br i1 %74, label %77, label %75

; <label>:75                                      ; preds = %68
  %76 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([37 x i8]* @.str10, i32 0, i32 0))
  store i32 1, i32* %1
  br label %276

; <label>:77                                      ; preds = %68
  %78 = call noalias i8* @malloc(i64 8) #4
  store i8* %78, i8** %des_key1, align 8
  %79 = load i8** %des_key1, align 8
  %80 = load %struct._IO_FILE** @key_file, align 8
  %81 = call i64 @fread(i8* %79, i64 1, i64 8, %struct._IO_FILE* %80)
  %82 = trunc i64 %81 to i16
  store i16 %82, i16* %bytes_read, align 2
  %83 = load i16* %bytes_read, align 2
  %84 = sext i16 %83 to i32
  %85 = icmp ne i32 %84, 8
  br i1 %85, label %86, label %90

; <label>:86                                      ; preds = %77
  %87 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([53 x i8]* @.str11, i32 0, i32 0))
  %88 = load %struct._IO_FILE** @key_file, align 8
  %89 = call i32 @fclose(%struct._IO_FILE* %88)
  store i32 1, i32* %1
  br label %276

; <label>:90                                      ; preds = %77
  %91 = load %struct._IO_FILE** @key_file, align 8
  %92 = call i32 @fclose(%struct._IO_FILE* %91)
  %93 = load i8*** %3, align 8
  %94 = getelementptr inbounds i8** %93, i64 3
  %95 = load i8** %94, align 8
  %96 = call %struct._IO_FILE* @fopen(i8* %95, i8* getelementptr inbounds ([3 x i8]* @.str9, i32 0, i32 0))
  store %struct._IO_FILE* %96, %struct._IO_FILE** @input_file, align 8
  %97 = load %struct._IO_FILE** @input_file, align 8
  %98 = icmp ne %struct._IO_FILE* %97, null
  br i1 %98, label %101, label %99

; <label>:99                                      ; preds = %90
  %100 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([40 x i8]* @.str12, i32 0, i32 0))
  store i32 1, i32* %1
  br label %276

; <label>:101                                     ; preds = %90
  %102 = load i8*** %3, align 8
  %103 = getelementptr inbounds i8** %102, i64 4
  %104 = load i8** %103, align 8
  %105 = call %struct._IO_FILE* @fopen(i8* %104, i8* getelementptr inbounds ([3 x i8]* @.str3, i32 0, i32 0))
  store %struct._IO_FILE* %105, %struct._IO_FILE** @output_file, align 8
  %106 = load %struct._IO_FILE** @output_file, align 8
  %107 = icmp ne %struct._IO_FILE* %106, null
  br i1 %107, label %110, label %108

; <label>:108                                     ; preds = %101
  %109 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([42 x i8]* @.str13, i32 0, i32 0))
  store i32 1, i32* %1
  br label %276

; <label>:110                                     ; preds = %101
  store i64 0, i64* %block_count, align 8
  %111 = call noalias i8* @malloc(i64 8) #4
  store i8* %111, i8** %data_block, align 8
  %112 = call noalias i8* @malloc(i64 8) #4
  store i8* %112, i8** %processed_block, align 8
  %113 = call noalias i8* @malloc(i64 272) #4
  %114 = bitcast i8* %113 to %struct.key_set*
  store %struct.key_set* %114, %struct.key_set** %key_sets, align 8
  %115 = call i64 @clock() #4
  store i64 %115, i64* %start, align 8
  %116 = load i8** %des_key1, align 8
  %117 = load %struct.key_set** %key_sets, align 8
  call void @generate_sub_keys(i8* %116, %struct.key_set* %117)
  %118 = call i64 @clock() #4
  store i64 %118, i64* %finish, align 8
  %119 = load i64* %finish, align 8
  %120 = load i64* %start, align 8
  %121 = sub nsw i64 %119, %120
  %122 = sitofp i64 %121 to double
  %123 = fdiv double %122, 1.000000e+06
  store double %123, double* %time_taken, align 8
  %124 = load i8*** %3, align 8
  %125 = getelementptr inbounds i8** %124, i64 1
  %126 = load i8** %125, align 8
  %127 = call i32 @strcmp(i8* %126, i8* getelementptr inbounds ([3 x i8]* @.str6, i32 0, i32 0)) #5
  %128 = icmp eq i32 %127, 0
  br i1 %128, label %129, label %131

; <label>:129                                     ; preds = %110
  store i16 1, i16* %process_mode, align 2
  %130 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([14 x i8]* @.str14, i32 0, i32 0))
  br label %133

; <label>:131                                     ; preds = %110
  store i16 0, i16* %process_mode, align 2
  %132 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([14 x i8]* @.str15, i32 0, i32 0))
  br label %133

; <label>:133                                     ; preds = %131, %129
  %134 = load %struct._IO_FILE** @input_file, align 8
  %135 = call i32 @fseek(%struct._IO_FILE* %134, i64 0, i32 2)
  %136 = load %struct._IO_FILE** @input_file, align 8
  %137 = call i64 @ftell(%struct._IO_FILE* %136)
  store i64 %137, i64* %file_size, align 8
  %138 = load %struct._IO_FILE** @input_file, align 8
  %139 = call i32 @fseek(%struct._IO_FILE* %138, i64 0, i32 0)
  %140 = load i64* %file_size, align 8
  %141 = udiv i64 %140, 8
  %142 = load i64* %file_size, align 8
  %143 = urem i64 %142, 8
  %144 = icmp ne i64 %143, 0
  %145 = select i1 %144, i32 1, i32 0
  %146 = sext i32 %145 to i64
  %147 = add i64 %141, %146
  store i64 %147, i64* %number_of_blocks, align 8
  %148 = call i64 @clock() #4
  store i64 %148, i64* %start, align 8
  br label %149

; <label>:149                                     ; preds = %249, %133
  %150 = load i8** %data_block, align 8
  %151 = load %struct._IO_FILE** @input_file, align 8
  %152 = call i64 @fread(i8* %150, i64 1, i64 8, %struct._IO_FILE* %151)
  %153 = icmp ne i64 %152, 0
  br i1 %153, label %154, label %251

; <label>:154                                     ; preds = %149
  %155 = load i64* %block_count, align 8
  %156 = add i64 %155, 1
  store i64 %156, i64* %block_count, align 8
  %157 = load i64* %block_count, align 8
  %158 = load i64* %number_of_blocks, align 8
  %159 = icmp eq i64 %157, %158
  br i1 %159, label %160, label %239

; <label>:160                                     ; preds = %154
  %161 = load i16* %process_mode, align 2
  %162 = sext i16 %161 to i32
  %163 = icmp eq i32 %162, 1
  br i1 %163, label %164, label %215

; <label>:164                                     ; preds = %160
  %165 = load i64* %file_size, align 8
  %166 = urem i64 %165, 8
  %167 = sub i64 8, %166
  %168 = trunc i64 %167 to i16
  store i16 %168, i16* %padding, align 2
  %169 = load i16* %padding, align 2
  %170 = zext i16 %169 to i32
  %171 = icmp slt i32 %170, 8
  br i1 %171, label %172, label %186

; <label>:172                                     ; preds = %164
  %173 = load i8** %data_block, align 8
  %174 = getelementptr inbounds i8* %173, i64 8
  %175 = load i16* %padding, align 2
  %176 = zext i16 %175 to i32
  %177 = sext i32 %176 to i64
  %178 = sub i64 0, %177
  %179 = getelementptr inbounds i8* %174, i64 %178
  %180 = load i16* %padding, align 2
  %181 = trunc i16 %180 to i8
  %182 = zext i8 %181 to i32
  %183 = trunc i32 %182 to i8
  %184 = load i16* %padding, align 2
  %185 = zext i16 %184 to i64
  call void @llvm.memset.p0i8.i64(i8* %179, i8 %183, i64 %185, i32 1, i1 false)
  br label %186

; <label>:186                                     ; preds = %172, %164
  %187 = load i8** %data_block, align 8
  %188 = load i8** %processed_block, align 8
  %189 = load %struct.key_set** %key_sets, align 8
  %190 = load i16* %process_mode, align 2
  %191 = sext i16 %190 to i32
  call void @process_message(i8* %187, i8* %188, %struct.key_set* %189, i32 %191)
  %192 = load i8** %processed_block, align 8
  %193 = load %struct._IO_FILE** @output_file, align 8
  %194 = call i64 @fwrite(i8* %192, i64 1, i64 8, %struct._IO_FILE* %193)
  %195 = trunc i64 %194 to i16
  store i16 %195, i16* %bytes_written2, align 2
  %196 = load i16* %padding, align 2
  %197 = zext i16 %196 to i32
  %198 = icmp eq i32 %197, 8
  br i1 %198, label %199, label %214

; <label>:199                                     ; preds = %186
  %200 = load i8** %data_block, align 8
  %201 = load i16* %padding, align 2
  %202 = trunc i16 %201 to i8
  %203 = zext i8 %202 to i32
  %204 = trunc i32 %203 to i8
  call void @llvm.memset.p0i8.i64(i8* %200, i8 %204, i64 8, i32 1, i1 false)
  %205 = load i8** %data_block, align 8
  %206 = load i8** %processed_block, align 8
  %207 = load %struct.key_set** %key_sets, align 8
  %208 = load i16* %process_mode, align 2
  %209 = sext i16 %208 to i32
  call void @process_message(i8* %205, i8* %206, %struct.key_set* %207, i32 %209)
  %210 = load i8** %processed_block, align 8
  %211 = load %struct._IO_FILE** @output_file, align 8
  %212 = call i64 @fwrite(i8* %210, i64 1, i64 8, %struct._IO_FILE* %211)
  %213 = trunc i64 %212 to i16
  store i16 %213, i16* %bytes_written2, align 2
  br label %214

; <label>:214                                     ; preds = %199, %186
  br label %238

; <label>:215                                     ; preds = %160
  %216 = load i8** %data_block, align 8
  %217 = load i8** %processed_block, align 8
  %218 = load %struct.key_set** %key_sets, align 8
  %219 = load i16* %process_mode, align 2
  %220 = sext i16 %219 to i32
  call void @process_message(i8* %216, i8* %217, %struct.key_set* %218, i32 %220)
  %221 = load i8** %processed_block, align 8
  %222 = getelementptr inbounds i8* %221, i64 7
  %223 = load i8* %222, align 1
  %224 = zext i8 %223 to i16
  store i16 %224, i16* %padding, align 2
  %225 = load i16* %padding, align 2
  %226 = zext i16 %225 to i32
  %227 = icmp slt i32 %226, 8
  br i1 %227, label %228, label %237

; <label>:228                                     ; preds = %215
  %229 = load i8** %processed_block, align 8
  %230 = load i16* %padding, align 2
  %231 = zext i16 %230 to i32
  %232 = sub nsw i32 8, %231
  %233 = sext i32 %232 to i64
  %234 = load %struct._IO_FILE** @output_file, align 8
  %235 = call i64 @fwrite(i8* %229, i64 1, i64 %233, %struct._IO_FILE* %234)
  %236 = trunc i64 %235 to i16
  store i16 %236, i16* %bytes_written2, align 2
  br label %237

; <label>:237                                     ; preds = %228, %215
  br label %238

; <label>:238                                     ; preds = %237, %214
  br label %249

; <label>:239                                     ; preds = %154
  %240 = load i8** %data_block, align 8
  %241 = load i8** %processed_block, align 8
  %242 = load %struct.key_set** %key_sets, align 8
  %243 = load i16* %process_mode, align 2
  %244 = sext i16 %243 to i32
  call void @process_message(i8* %240, i8* %241, %struct.key_set* %242, i32 %244)
  %245 = load i8** %processed_block, align 8
  %246 = load %struct._IO_FILE** @output_file, align 8
  %247 = call i64 @fwrite(i8* %245, i64 1, i64 8, %struct._IO_FILE* %246)
  %248 = trunc i64 %247 to i16
  store i16 %248, i16* %bytes_written2, align 2
  br label %249

; <label>:249                                     ; preds = %239, %238
  %250 = load i8** %data_block, align 8
  call void @llvm.memset.p0i8.i64(i8* %250, i8 0, i64 8, i32 1, i1 false)
  br label %149

; <label>:251                                     ; preds = %149
  %252 = call i64 @clock() #4
  store i64 %252, i64* %finish, align 8
  %253 = load i8** %des_key1, align 8
  call void @free(i8* %253) #4
  %254 = load i8** %data_block, align 8
  call void @free(i8* %254) #4
  %255 = load i8** %processed_block, align 8
  call void @free(i8* %255) #4
  %256 = load %struct._IO_FILE** @input_file, align 8
  %257 = call i32 @fclose(%struct._IO_FILE* %256)
  %258 = load %struct._IO_FILE** @output_file, align 8
  %259 = call i32 @fclose(%struct._IO_FILE* %258)
  %260 = load i64* %finish, align 8
  %261 = load i64* %start, align 8
  %262 = sub nsw i64 %260, %261
  %263 = sitofp i64 %262 to double
  %264 = fdiv double %263, 1.000000e+06
  store double %264, double* %time_taken, align 8
  %265 = load i8*** %3, align 8
  %266 = getelementptr inbounds i8** %265, i64 3
  %267 = load i8** %266, align 8
  %268 = load double* %time_taken, align 8
  %269 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([50 x i8]* @.str16, i32 0, i32 0), i8* %267, double %268)
  store i32 0, i32* %1
  br label %276

; <label>:270                                     ; preds = %56
  %271 = load i8*** %3, align 8
  %272 = getelementptr inbounds i8** %271, i64 1
  %273 = load i8** %272, align 8
  %274 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([62 x i8]* @.str17, i32 0, i32 0), i8* %273)
  store i32 1, i32* %1
  br label %276

; <label>:275                                     ; preds = %46
  store i32 0, i32* %1
  br label %276

; <label>:276                                     ; preds = %275, %270, %251, %108, %99, %86, %75, %65, %41, %26, %17, %6
  %277 = load i32* %1
  ret i32 %277
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8*, i8*) #2

declare %struct._IO_FILE* @fopen(i8*, i8*) #1

; Function Attrs: nounwind
declare i64 @time(i64*) #3

; Function Attrs: nounwind
declare void @srand(i32) #3

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #3

declare void @generate_key(i8*) #1

declare i64 @fwrite(i8*, i64, i64, %struct._IO_FILE*) #1

declare i32 @fclose(%struct._IO_FILE*) #1

; Function Attrs: nounwind
declare void @free(i8*) #3

declare i64 @fread(i8*, i64, i64, %struct._IO_FILE*) #1

; Function Attrs: nounwind
declare i64 @clock() #3

declare void @generate_sub_keys(i8*, %struct.key_set*) #1

declare i32 @fseek(%struct._IO_FILE*, i64, i32) #1

declare i64 @ftell(%struct._IO_FILE*) #1

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #4

declare void @process_message(i8*, i8*, %struct.key_set*, i32) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = !{!"Obfuscator-LLVM clang version 3.6.1 (tags/RELEASE_361/final) (based on Obfuscator-LLVM 3.6.1)"}
