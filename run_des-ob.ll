; ModuleID = 'run_des-ob.c'
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
  br label %309

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
  br label %309

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
  br label %309

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
  br label %309

; <label>:46                                      ; preds = %28
  %47 = load i8** %des_key, align 8
  call void @free(i8* %47) #4
  %48 = load %struct._IO_FILE** @key_file, align 8
  %49 = call i32 @fclose(%struct._IO_FILE* %48)
  br label %308

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
  br i1 %61, label %62, label %303

; <label>:62                                      ; preds = %56, %50
  %63 = load i32* %2, align 4
  %64 = icmp ne i32 %63, 5
  br i1 %64, label %65, label %68

; <label>:65                                      ; preds = %62
  %66 = load i32* %2, align 4
  %67 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([98 x i8]* @.str8, i32 0, i32 0), i32 %66)
  store i32 1, i32* %1
  br label %309

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
  br label %309

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
  br label %309

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
  br label %309

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
  br label %309

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
  %121 = sub i64 0, %120
  %122 = xor i64 %119, %121
  %123 = and i64 %119, %121
  %124 = add i64 %123, %123
  %125 = add nsw i64 %122, %124
  %126 = sub nsw i64 %119, %120
  %127 = sitofp i64 %125 to double
  %128 = fdiv double %127, 1.000000e+06
  store double %128, double* %time_taken, align 8
  %129 = load i8*** %3, align 8
  %130 = getelementptr inbounds i8** %129, i64 1
  %131 = load i8** %130, align 8
  %132 = call i32 @strcmp(i8* %131, i8* getelementptr inbounds ([3 x i8]* @.str6, i32 0, i32 0)) #5
  %133 = icmp eq i32 %132, 0
  br i1 %133, label %134, label %136

; <label>:134                                     ; preds = %110
  store i16 1, i16* %process_mode, align 2
  %135 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([14 x i8]* @.str14, i32 0, i32 0))
  br label %138

; <label>:136                                     ; preds = %110
  store i16 0, i16* %process_mode, align 2
  %137 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([14 x i8]* @.str15, i32 0, i32 0))
  br label %138

; <label>:138                                     ; preds = %136, %134
  %139 = load %struct._IO_FILE** @input_file, align 8
  %140 = call i32 @fseek(%struct._IO_FILE* %139, i64 0, i32 2)
  %141 = load %struct._IO_FILE** @input_file, align 8
  %142 = call i64 @ftell(%struct._IO_FILE* %141)
  store i64 %142, i64* %file_size, align 8
  %143 = load %struct._IO_FILE** @input_file, align 8
  %144 = call i32 @fseek(%struct._IO_FILE* %143, i64 0, i32 0)
  %145 = load i64* %file_size, align 8
  %146 = udiv i64 %145, 8
  %147 = load i64* %file_size, align 8
  %148 = urem i64 %147, 8
  %149 = icmp ne i64 %148, 0
  %150 = select i1 %149, i32 1, i32 0
  %151 = sext i32 %150 to i64
  %152 = xor i64 %146, %151
  %153 = and i64 %146, %151
  %154 = add i64 %153, %153
  %155 = add i64 %152, %154
  %156 = add i64 %146, %151
  store i64 %155, i64* %number_of_blocks, align 8
  %157 = call i64 @clock() #4
  store i64 %157, i64* %start, align 8
  br label %158

; <label>:158                                     ; preds = %277, %138
  %159 = load i8** %data_block, align 8
  %160 = load %struct._IO_FILE** @input_file, align 8
  %161 = call i64 @fread(i8* %159, i64 1, i64 8, %struct._IO_FILE* %160)
  %162 = icmp ne i64 %161, 0
  br i1 %162, label %163, label %279

; <label>:163                                     ; preds = %158
  %164 = load i64* %block_count, align 8
  %165 = xor i64 %164, 1
  %166 = and i64 %164, 1
  %167 = add i64 %166, %166
  %168 = add i64 %165, %167
  %169 = add i64 %164, 1
  store i64 %168, i64* %block_count, align 8
  %170 = load i64* %block_count, align 8
  %171 = load i64* %number_of_blocks, align 8
  %172 = icmp eq i64 %170, %171
  br i1 %172, label %173, label %267

; <label>:173                                     ; preds = %163
  %174 = load i16* %process_mode, align 2
  %175 = sext i16 %174 to i32
  %176 = icmp eq i32 %175, 1
  br i1 %176, label %177, label %238

; <label>:177                                     ; preds = %173
  %178 = load i64* %file_size, align 8
  %179 = urem i64 %178, 8
  %180 = sub i64 0, %179
  %181 = xor i64 8, %180
  %182 = and i64 8, %180
  %183 = add i64 %182, %182
  %184 = add i64 %181, %183
  %185 = sub i64 8, %179
  %186 = trunc i64 %184 to i16
  store i16 %186, i16* %padding, align 2
  %187 = load i16* %padding, align 2
  %188 = zext i16 %187 to i32
  %189 = icmp slt i32 %188, 8
  br i1 %189, label %190, label %209

; <label>:190                                     ; preds = %177
  %191 = load i8** %data_block, align 8
  %192 = getelementptr inbounds i8* %191, i64 8
  %193 = load i16* %padding, align 2
  %194 = zext i16 %193 to i32
  %195 = sext i32 %194 to i64
  %196 = sub i64 0, %195
  %197 = xor i64 0, %196
  %198 = and i64 0, %196
  %199 = add i64 %198, %198
  %200 = add i64 %197, %199
  %201 = sub i64 0, %195
  %202 = getelementptr inbounds i8* %192, i64 %200
  %203 = load i16* %padding, align 2
  %204 = trunc i16 %203 to i8
  %205 = zext i8 %204 to i32
  %206 = trunc i32 %205 to i8
  %207 = load i16* %padding, align 2
  %208 = zext i16 %207 to i64
  call void @llvm.memset.p0i8.i64(i8* %202, i8 %206, i64 %208, i32 1, i1 false)
  br label %209

; <label>:209                                     ; preds = %190, %177
  %210 = load i8** %data_block, align 8
  %211 = load i8** %processed_block, align 8
  %212 = load %struct.key_set** %key_sets, align 8
  %213 = load i16* %process_mode, align 2
  %214 = sext i16 %213 to i32
  call void @process_message(i8* %210, i8* %211, %struct.key_set* %212, i32 %214)
  %215 = load i8** %processed_block, align 8
  %216 = load %struct._IO_FILE** @output_file, align 8
  %217 = call i64 @fwrite(i8* %215, i64 1, i64 8, %struct._IO_FILE* %216)
  %218 = trunc i64 %217 to i16
  store i16 %218, i16* %bytes_written2, align 2
  %219 = load i16* %padding, align 2
  %220 = zext i16 %219 to i32
  %221 = icmp eq i32 %220, 8
  br i1 %221, label %222, label %237

; <label>:222                                     ; preds = %209
  %223 = load i8** %data_block, align 8
  %224 = load i16* %padding, align 2
  %225 = trunc i16 %224 to i8
  %226 = zext i8 %225 to i32
  %227 = trunc i32 %226 to i8
  call void @llvm.memset.p0i8.i64(i8* %223, i8 %227, i64 8, i32 1, i1 false)
  %228 = load i8** %data_block, align 8
  %229 = load i8** %processed_block, align 8
  %230 = load %struct.key_set** %key_sets, align 8
  %231 = load i16* %process_mode, align 2
  %232 = sext i16 %231 to i32
  call void @process_message(i8* %228, i8* %229, %struct.key_set* %230, i32 %232)
  %233 = load i8** %processed_block, align 8
  %234 = load %struct._IO_FILE** @output_file, align 8
  %235 = call i64 @fwrite(i8* %233, i64 1, i64 8, %struct._IO_FILE* %234)
  %236 = trunc i64 %235 to i16
  store i16 %236, i16* %bytes_written2, align 2
  br label %237

; <label>:237                                     ; preds = %222, %209
  br label %266

; <label>:238                                     ; preds = %173
  %239 = load i8** %data_block, align 8
  %240 = load i8** %processed_block, align 8
  %241 = load %struct.key_set** %key_sets, align 8
  %242 = load i16* %process_mode, align 2
  %243 = sext i16 %242 to i32
  call void @process_message(i8* %239, i8* %240, %struct.key_set* %241, i32 %243)
  %244 = load i8** %processed_block, align 8
  %245 = getelementptr inbounds i8* %244, i64 7
  %246 = load i8* %245, align 1
  %247 = zext i8 %246 to i16
  store i16 %247, i16* %padding, align 2
  %248 = load i16* %padding, align 2
  %249 = zext i16 %248 to i32
  %250 = icmp slt i32 %249, 8
  br i1 %250, label %251, label %265

; <label>:251                                     ; preds = %238
  %252 = load i8** %processed_block, align 8
  %253 = load i16* %padding, align 2
  %254 = zext i16 %253 to i32
  %255 = sub i32 0, %254
  %256 = xor i32 8, %255
  %257 = and i32 8, %255
  %258 = add i32 %257, %257
  %259 = add nsw i32 %256, %258
  %260 = sub nsw i32 8, %254
  %261 = sext i32 %259 to i64
  %262 = load %struct._IO_FILE** @output_file, align 8
  %263 = call i64 @fwrite(i8* %252, i64 1, i64 %261, %struct._IO_FILE* %262)
  %264 = trunc i64 %263 to i16
  store i16 %264, i16* %bytes_written2, align 2
  br label %265

; <label>:265                                     ; preds = %251, %238
  br label %266

; <label>:266                                     ; preds = %265, %237
  br label %277

; <label>:267                                     ; preds = %163
  %268 = load i8** %data_block, align 8
  %269 = load i8** %processed_block, align 8
  %270 = load %struct.key_set** %key_sets, align 8
  %271 = load i16* %process_mode, align 2
  %272 = sext i16 %271 to i32
  call void @process_message(i8* %268, i8* %269, %struct.key_set* %270, i32 %272)
  %273 = load i8** %processed_block, align 8
  %274 = load %struct._IO_FILE** @output_file, align 8
  %275 = call i64 @fwrite(i8* %273, i64 1, i64 8, %struct._IO_FILE* %274)
  %276 = trunc i64 %275 to i16
  store i16 %276, i16* %bytes_written2, align 2
  br label %277

; <label>:277                                     ; preds = %267, %266
  %278 = load i8** %data_block, align 8
  call void @llvm.memset.p0i8.i64(i8* %278, i8 0, i64 8, i32 1, i1 false)
  br label %158

; <label>:279                                     ; preds = %158
  %280 = call i64 @clock() #4
  store i64 %280, i64* %finish, align 8
  %281 = load i8** %des_key1, align 8
  call void @free(i8* %281) #4
  %282 = load i8** %data_block, align 8
  call void @free(i8* %282) #4
  %283 = load i8** %processed_block, align 8
  call void @free(i8* %283) #4
  %284 = load %struct._IO_FILE** @input_file, align 8
  %285 = call i32 @fclose(%struct._IO_FILE* %284)
  %286 = load %struct._IO_FILE** @output_file, align 8
  %287 = call i32 @fclose(%struct._IO_FILE* %286)
  %288 = load i64* %finish, align 8
  %289 = load i64* %start, align 8
  %290 = sub i64 0, %289
  %291 = xor i64 %288, %290
  %292 = and i64 %288, %290
  %293 = add i64 %292, %292
  %294 = add nsw i64 %291, %293
  %295 = sub nsw i64 %288, %289
  %296 = sitofp i64 %294 to double
  %297 = fdiv double %296, 1.000000e+06
  store double %297, double* %time_taken, align 8
  %298 = load i8*** %3, align 8
  %299 = getelementptr inbounds i8** %298, i64 3
  %300 = load i8** %299, align 8
  %301 = load double* %time_taken, align 8
  %302 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([50 x i8]* @.str16, i32 0, i32 0), i8* %300, double %301)
  store i32 0, i32* %1
  br label %309

; <label>:303                                     ; preds = %56
  %304 = load i8*** %3, align 8
  %305 = getelementptr inbounds i8** %304, i64 1
  %306 = load i8** %305, align 8
  %307 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([62 x i8]* @.str17, i32 0, i32 0), i8* %306)
  store i32 1, i32* %1
  br label %309

; <label>:308                                     ; preds = %46
  store i32 0, i32* %1
  br label %309

; <label>:309                                     ; preds = %308, %303, %279, %108, %99, %86, %75, %65, %41, %26, %17, %6
  %310 = load i32* %1
  ret i32 %310
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
