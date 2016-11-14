; ModuleID = 'des.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.key_set = type { [8 x i8], [4 x i8], [4 x i8] }

@initial_key_permutaion = global [56 x i32] [i32 57, i32 49, i32 41, i32 33, i32 25, i32 17, i32 9, i32 1, i32 58, i32 50, i32 42, i32 34, i32 26, i32 18, i32 10, i32 2, i32 59, i32 51, i32 43, i32 35, i32 27, i32 19, i32 11, i32 3, i32 60, i32 52, i32 44, i32 36, i32 63, i32 55, i32 47, i32 39, i32 31, i32 23, i32 15, i32 7, i32 62, i32 54, i32 46, i32 38, i32 30, i32 22, i32 14, i32 6, i32 61, i32 53, i32 45, i32 37, i32 29, i32 21, i32 13, i32 5, i32 28, i32 20, i32 12, i32 4], align 16
@initial_message_permutation = global [64 x i32] [i32 58, i32 50, i32 42, i32 34, i32 26, i32 18, i32 10, i32 2, i32 60, i32 52, i32 44, i32 36, i32 28, i32 20, i32 12, i32 4, i32 62, i32 54, i32 46, i32 38, i32 30, i32 22, i32 14, i32 6, i32 64, i32 56, i32 48, i32 40, i32 32, i32 24, i32 16, i32 8, i32 57, i32 49, i32 41, i32 33, i32 25, i32 17, i32 9, i32 1, i32 59, i32 51, i32 43, i32 35, i32 27, i32 19, i32 11, i32 3, i32 61, i32 53, i32 45, i32 37, i32 29, i32 21, i32 13, i32 5, i32 63, i32 55, i32 47, i32 39, i32 31, i32 23, i32 15, i32 7], align 16
@key_shift_sizes = global [17 x i32] [i32 -1, i32 1, i32 1, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 1, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 1], align 16
@sub_key_permutation = global [48 x i32] [i32 14, i32 17, i32 11, i32 24, i32 1, i32 5, i32 3, i32 28, i32 15, i32 6, i32 21, i32 10, i32 23, i32 19, i32 12, i32 4, i32 26, i32 8, i32 16, i32 7, i32 27, i32 20, i32 13, i32 2, i32 41, i32 52, i32 31, i32 37, i32 47, i32 55, i32 30, i32 40, i32 51, i32 45, i32 33, i32 48, i32 44, i32 49, i32 39, i32 56, i32 34, i32 53, i32 46, i32 42, i32 50, i32 36, i32 29, i32 32], align 16
@message_expansion = global [48 x i32] [i32 32, i32 1, i32 2, i32 3, i32 4, i32 5, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 28, i32 29, i32 30, i32 31, i32 32, i32 1], align 16
@S1 = global [64 x i32] [i32 14, i32 4, i32 13, i32 1, i32 2, i32 15, i32 11, i32 8, i32 3, i32 10, i32 6, i32 12, i32 5, i32 9, i32 0, i32 7, i32 0, i32 15, i32 7, i32 4, i32 14, i32 2, i32 13, i32 1, i32 10, i32 6, i32 12, i32 11, i32 9, i32 5, i32 3, i32 8, i32 4, i32 1, i32 14, i32 8, i32 13, i32 6, i32 2, i32 11, i32 15, i32 12, i32 9, i32 7, i32 3, i32 10, i32 5, i32 0, i32 15, i32 12, i32 8, i32 2, i32 4, i32 9, i32 1, i32 7, i32 5, i32 11, i32 3, i32 14, i32 10, i32 0, i32 6, i32 13], align 16
@S2 = global [64 x i32] [i32 15, i32 1, i32 8, i32 14, i32 6, i32 11, i32 3, i32 4, i32 9, i32 7, i32 2, i32 13, i32 12, i32 0, i32 5, i32 10, i32 3, i32 13, i32 4, i32 7, i32 15, i32 2, i32 8, i32 14, i32 12, i32 0, i32 1, i32 10, i32 6, i32 9, i32 11, i32 5, i32 0, i32 14, i32 7, i32 11, i32 10, i32 4, i32 13, i32 1, i32 5, i32 8, i32 12, i32 6, i32 9, i32 3, i32 2, i32 15, i32 13, i32 8, i32 10, i32 1, i32 3, i32 15, i32 4, i32 2, i32 11, i32 6, i32 7, i32 12, i32 0, i32 5, i32 14, i32 9], align 16
@S3 = global [64 x i32] [i32 10, i32 0, i32 9, i32 14, i32 6, i32 3, i32 15, i32 5, i32 1, i32 13, i32 12, i32 7, i32 11, i32 4, i32 2, i32 8, i32 13, i32 7, i32 0, i32 9, i32 3, i32 4, i32 6, i32 10, i32 2, i32 8, i32 5, i32 14, i32 12, i32 11, i32 15, i32 1, i32 13, i32 6, i32 4, i32 9, i32 8, i32 15, i32 3, i32 0, i32 11, i32 1, i32 2, i32 12, i32 5, i32 10, i32 14, i32 7, i32 1, i32 10, i32 13, i32 0, i32 6, i32 9, i32 8, i32 7, i32 4, i32 15, i32 14, i32 3, i32 11, i32 5, i32 2, i32 12], align 16
@S4 = global [64 x i32] [i32 7, i32 13, i32 14, i32 3, i32 0, i32 6, i32 9, i32 10, i32 1, i32 2, i32 8, i32 5, i32 11, i32 12, i32 4, i32 15, i32 13, i32 8, i32 11, i32 5, i32 6, i32 15, i32 0, i32 3, i32 4, i32 7, i32 2, i32 12, i32 1, i32 10, i32 14, i32 9, i32 10, i32 6, i32 9, i32 0, i32 12, i32 11, i32 7, i32 13, i32 15, i32 1, i32 3, i32 14, i32 5, i32 2, i32 8, i32 4, i32 3, i32 15, i32 0, i32 6, i32 10, i32 1, i32 13, i32 8, i32 9, i32 4, i32 5, i32 11, i32 12, i32 7, i32 2, i32 14], align 16
@S5 = global [64 x i32] [i32 2, i32 12, i32 4, i32 1, i32 7, i32 10, i32 11, i32 6, i32 8, i32 5, i32 3, i32 15, i32 13, i32 0, i32 14, i32 9, i32 14, i32 11, i32 2, i32 12, i32 4, i32 7, i32 13, i32 1, i32 5, i32 0, i32 15, i32 10, i32 3, i32 9, i32 8, i32 6, i32 4, i32 2, i32 1, i32 11, i32 10, i32 13, i32 7, i32 8, i32 15, i32 9, i32 12, i32 5, i32 6, i32 3, i32 0, i32 14, i32 11, i32 8, i32 12, i32 7, i32 1, i32 14, i32 2, i32 13, i32 6, i32 15, i32 0, i32 9, i32 10, i32 4, i32 5, i32 3], align 16
@S6 = global [64 x i32] [i32 12, i32 1, i32 10, i32 15, i32 9, i32 2, i32 6, i32 8, i32 0, i32 13, i32 3, i32 4, i32 14, i32 7, i32 5, i32 11, i32 10, i32 15, i32 4, i32 2, i32 7, i32 12, i32 9, i32 5, i32 6, i32 1, i32 13, i32 14, i32 0, i32 11, i32 3, i32 8, i32 9, i32 14, i32 15, i32 5, i32 2, i32 8, i32 12, i32 3, i32 7, i32 0, i32 4, i32 10, i32 1, i32 13, i32 11, i32 6, i32 4, i32 3, i32 2, i32 12, i32 9, i32 5, i32 15, i32 10, i32 11, i32 14, i32 1, i32 7, i32 6, i32 0, i32 8, i32 13], align 16
@S7 = global [64 x i32] [i32 4, i32 11, i32 2, i32 14, i32 15, i32 0, i32 8, i32 13, i32 3, i32 12, i32 9, i32 7, i32 5, i32 10, i32 6, i32 1, i32 13, i32 0, i32 11, i32 7, i32 4, i32 9, i32 1, i32 10, i32 14, i32 3, i32 5, i32 12, i32 2, i32 15, i32 8, i32 6, i32 1, i32 4, i32 11, i32 13, i32 12, i32 3, i32 7, i32 14, i32 10, i32 15, i32 6, i32 8, i32 0, i32 5, i32 9, i32 2, i32 6, i32 11, i32 13, i32 8, i32 1, i32 4, i32 10, i32 7, i32 9, i32 5, i32 0, i32 15, i32 14, i32 2, i32 3, i32 12], align 16
@S8 = global [64 x i32] [i32 13, i32 2, i32 8, i32 4, i32 6, i32 15, i32 11, i32 1, i32 10, i32 9, i32 3, i32 14, i32 5, i32 0, i32 12, i32 7, i32 1, i32 15, i32 13, i32 8, i32 10, i32 3, i32 7, i32 4, i32 12, i32 5, i32 6, i32 11, i32 0, i32 14, i32 9, i32 2, i32 7, i32 11, i32 4, i32 1, i32 9, i32 12, i32 14, i32 2, i32 0, i32 6, i32 10, i32 13, i32 15, i32 3, i32 5, i32 8, i32 2, i32 1, i32 14, i32 7, i32 4, i32 10, i32 8, i32 13, i32 15, i32 12, i32 9, i32 0, i32 3, i32 5, i32 6, i32 11], align 16
@right_sub_message_permutation = global [32 x i32] [i32 16, i32 7, i32 20, i32 21, i32 29, i32 12, i32 28, i32 17, i32 1, i32 15, i32 23, i32 26, i32 5, i32 18, i32 31, i32 10, i32 2, i32 8, i32 24, i32 14, i32 32, i32 27, i32 3, i32 9, i32 19, i32 13, i32 30, i32 6, i32 22, i32 11, i32 4, i32 25], align 16
@final_message_permutation = global [64 x i32] [i32 40, i32 8, i32 48, i32 16, i32 56, i32 24, i32 64, i32 32, i32 39, i32 7, i32 47, i32 15, i32 55, i32 23, i32 63, i32 31, i32 38, i32 6, i32 46, i32 14, i32 54, i32 22, i32 62, i32 30, i32 37, i32 5, i32 45, i32 13, i32 53, i32 21, i32 61, i32 29, i32 36, i32 4, i32 44, i32 12, i32 52, i32 20, i32 60, i32 28, i32 35, i32 3, i32 43, i32 11, i32 51, i32 19, i32 59, i32 27, i32 34, i32 2, i32 42, i32 10, i32 50, i32 18, i32 58, i32 26, i32 33, i32 1, i32 41, i32 9, i32 49, i32 17, i32 57, i32 25], align 16
@.str = private unnamed_addr constant [2 x i8] c"1\00", align 1
@.str1 = private unnamed_addr constant [2 x i8] c"0\00", align 1
@.str2 = private unnamed_addr constant [5 x i8] c"K: \0A\00", align 1
@.str3 = private unnamed_addr constant [8 x i8] c"%02X : \00", align 1
@.str4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str5 = private unnamed_addr constant [6 x i8] c"\0AC: \0A\00", align 1
@.str6 = private unnamed_addr constant [6 x i8] c"\0AD: \0A\00", align 1

; Function Attrs: nounwind uwtable
define void @print_char_as_binary(i8 signext %input) #0 {
  %1 = alloca i8, align 1
  %i = alloca i32, align 4
  %shift_byte = alloca i8, align 1
  store i8 %input, i8* %1, align 1
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %34, %0
  %3 = load i32* %i, align 4
  %4 = icmp slt i32 %3, 8
  br i1 %4, label %5, label %41

; <label>:5                                       ; preds = %2
  %6 = load i32* %i, align 4
  %7 = sub i32 0, %6
  %8 = xor i32 7, %7
  %9 = and i32 7, %7
  %10 = add i32 %9, %9
  %11 = add nsw i32 %8, %10
  %12 = sub nsw i32 7, %6
  %13 = shl i32 1, %11
  %14 = trunc i32 %13 to i8
  store i8 %14, i8* %shift_byte, align 1
  %15 = load i8* %shift_byte, align 1
  %16 = sext i8 %15 to i32
  %17 = load i8* %1, align 1
  %18 = sext i8 %17 to i32
  %19 = xor i32 -843951975, -1
  %20 = or i32 %16, -843951975
  %21 = or i32 %18, -843951975
  %22 = or i32 %16, %19
  %23 = or i32 %18, %19
  %24 = and i32 %20, %21
  %25 = and i32 %24, %22
  %26 = and i32 %25, %23
  %27 = and i32 %16, %18
  %28 = icmp ne i32 %26, 0
  br i1 %28, label %29, label %31

; <label>:29                                      ; preds = %5
  %30 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str, i32 0, i32 0))
  br label %33

; <label>:31                                      ; preds = %5
  %32 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str1, i32 0, i32 0))
  br label %33

; <label>:33                                      ; preds = %31, %29
  br label %34

; <label>:34                                      ; preds = %33
  %35 = load i32* %i, align 4
  %36 = xor i32 %35, 1
  %37 = and i32 %35, 1
  %38 = add i32 %37, %37
  %39 = add nsw i32 %36, %38
  %40 = add nsw i32 %35, 1
  store i32 %39, i32* %i, align 4
  br label %2

; <label>:41                                      ; preds = %2
  ret void
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind uwtable
define void @generate_key(i8* %key) #0 {
  %1 = alloca i8*, align 8
  %i = alloca i32, align 4
  store i8* %key, i8** %1, align 8
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %13, %0
  %3 = load i32* %i, align 4
  %4 = icmp slt i32 %3, 8
  br i1 %4, label %5, label %20

; <label>:5                                       ; preds = %2
  %6 = call i32 @rand() #3
  %7 = srem i32 %6, 255
  %8 = trunc i32 %7 to i8
  %9 = load i32* %i, align 4
  %10 = sext i32 %9 to i64
  %11 = load i8** %1, align 8
  %12 = getelementptr inbounds i8* %11, i64 %10
  store i8 %8, i8* %12, align 1
  br label %13

; <label>:13                                      ; preds = %5
  %14 = load i32* %i, align 4
  %15 = xor i32 %14, 1
  %16 = and i32 %14, 1
  %17 = add i32 %16, %16
  %18 = add nsw i32 %15, %17
  %19 = add nsw i32 %14, 1
  store i32 %18, i32* %i, align 4
  br label %2

; <label>:20                                      ; preds = %2
  ret void
}

; Function Attrs: nounwind
declare i32 @rand() #2

; Function Attrs: nounwind uwtable
define void @print_key_set(i64 %key_set.coerce0, i64 %key_set.coerce1) #0 {
  %key_set = alloca %struct.key_set, align 8
  %i = alloca i32, align 4
  %1 = bitcast %struct.key_set* %key_set to { i64, i64 }*
  %2 = getelementptr { i64, i64 }* %1, i32 0, i32 0
  store i64 %key_set.coerce0, i64* %2
  %3 = getelementptr { i64, i64 }* %1, i32 0, i32 1
  store i64 %key_set.coerce1, i64* %3
  %4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str2, i32 0, i32 0))
  store i32 0, i32* %i, align 4
  br label %5

; <label>:5                                       ; preds = %22, %0
  %6 = load i32* %i, align 4
  %7 = icmp slt i32 %6, 8
  br i1 %7, label %8, label %29

; <label>:8                                       ; preds = %5
  %9 = load i32* %i, align 4
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds %struct.key_set* %key_set, i32 0, i32 0
  %12 = getelementptr inbounds [8 x i8]* %11, i32 0, i64 %10
  %13 = load i8* %12, align 1
  %14 = zext i8 %13 to i32
  %15 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str3, i32 0, i32 0), i32 %14)
  %16 = load i32* %i, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds %struct.key_set* %key_set, i32 0, i32 0
  %19 = getelementptr inbounds [8 x i8]* %18, i32 0, i64 %17
  %20 = load i8* %19, align 1
  call void @print_char_as_binary(i8 signext %20)
  %21 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str4, i32 0, i32 0))
  br label %22

; <label>:22                                      ; preds = %8
  %23 = load i32* %i, align 4
  %24 = xor i32 %23, 1
  %25 = and i32 %23, 1
  %26 = add i32 %25, %25
  %27 = add nsw i32 %24, %26
  %28 = add nsw i32 %23, 1
  store i32 %27, i32* %i, align 4
  br label %5

; <label>:29                                      ; preds = %5
  %30 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str5, i32 0, i32 0))
  store i32 0, i32* %i, align 4
  br label %31

; <label>:31                                      ; preds = %48, %29
  %32 = load i32* %i, align 4
  %33 = icmp slt i32 %32, 4
  br i1 %33, label %34, label %55

; <label>:34                                      ; preds = %31
  %35 = load i32* %i, align 4
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds %struct.key_set* %key_set, i32 0, i32 1
  %38 = getelementptr inbounds [4 x i8]* %37, i32 0, i64 %36
  %39 = load i8* %38, align 1
  %40 = zext i8 %39 to i32
  %41 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str3, i32 0, i32 0), i32 %40)
  %42 = load i32* %i, align 4
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds %struct.key_set* %key_set, i32 0, i32 1
  %45 = getelementptr inbounds [4 x i8]* %44, i32 0, i64 %43
  %46 = load i8* %45, align 1
  call void @print_char_as_binary(i8 signext %46)
  %47 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str4, i32 0, i32 0))
  br label %48

; <label>:48                                      ; preds = %34
  %49 = load i32* %i, align 4
  %50 = xor i32 %49, 1
  %51 = and i32 %49, 1
  %52 = add i32 %51, %51
  %53 = add nsw i32 %50, %52
  %54 = add nsw i32 %49, 1
  store i32 %53, i32* %i, align 4
  br label %31

; <label>:55                                      ; preds = %31
  %56 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str6, i32 0, i32 0))
  store i32 0, i32* %i, align 4
  br label %57

; <label>:57                                      ; preds = %74, %55
  %58 = load i32* %i, align 4
  %59 = icmp slt i32 %58, 4
  br i1 %59, label %60, label %81

; <label>:60                                      ; preds = %57
  %61 = load i32* %i, align 4
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds %struct.key_set* %key_set, i32 0, i32 2
  %64 = getelementptr inbounds [4 x i8]* %63, i32 0, i64 %62
  %65 = load i8* %64, align 1
  %66 = zext i8 %65 to i32
  %67 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str3, i32 0, i32 0), i32 %66)
  %68 = load i32* %i, align 4
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds %struct.key_set* %key_set, i32 0, i32 2
  %71 = getelementptr inbounds [4 x i8]* %70, i32 0, i64 %69
  %72 = load i8* %71, align 1
  call void @print_char_as_binary(i8 signext %72)
  %73 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str4, i32 0, i32 0))
  br label %74

; <label>:74                                      ; preds = %60
  %75 = load i32* %i, align 4
  %76 = xor i32 %75, 1
  %77 = and i32 %75, 1
  %78 = add i32 %77, %77
  %79 = add nsw i32 %76, %78
  %80 = add nsw i32 %75, 1
  store i32 %79, i32* %i, align 4
  br label %57

; <label>:81                                      ; preds = %57
  %82 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str4, i32 0, i32 0))
  ret void
}

; Function Attrs: nounwind uwtable
define void @generate_sub_keys(i8* %main_key, %struct.key_set* %key_sets) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca %struct.key_set*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %shift_size = alloca i32, align 4
  %shift_byte = alloca i8, align 1
  %first_shift_bits = alloca i8, align 1
  %second_shift_bits = alloca i8, align 1
  %third_shift_bits = alloca i8, align 1
  %fourth_shift_bits = alloca i8, align 1
  store i8* %main_key, i8** %1, align 8
  store %struct.key_set* %key_sets, %struct.key_set** %2, align 8
  store i32 0, i32* %i, align 4
  br label %3

; <label>:3                                       ; preds = %13, %0
  %4 = load i32* %i, align 4
  %5 = icmp slt i32 %4, 8
  br i1 %5, label %6, label %20

; <label>:6                                       ; preds = %3
  %7 = load i32* %i, align 4
  %8 = sext i32 %7 to i64
  %9 = load %struct.key_set** %2, align 8
  %10 = getelementptr inbounds %struct.key_set* %9, i64 0
  %11 = getelementptr inbounds %struct.key_set* %10, i32 0, i32 0
  %12 = getelementptr inbounds [8 x i8]* %11, i32 0, i64 %8
  store i8 0, i8* %12, align 1
  br label %13

; <label>:13                                      ; preds = %6
  %14 = load i32* %i, align 4
  %15 = xor i32 %14, 1
  %16 = and i32 %14, 1
  %17 = add i32 %16, %16
  %18 = add nsw i32 %15, %17
  %19 = add nsw i32 %14, 1
  store i32 %18, i32* %i, align 4
  br label %3

; <label>:20                                      ; preds = %3
  store i32 0, i32* %i, align 4
  br label %21

; <label>:21                                      ; preds = %95, %20
  %22 = load i32* %i, align 4
  %23 = icmp slt i32 %22, 56
  br i1 %23, label %24, label %102

; <label>:24                                      ; preds = %21
  %25 = load i32* %i, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds [56 x i32]* @initial_key_permutaion, i32 0, i64 %26
  %28 = load i32* %27, align 4
  store i32 %28, i32* %shift_size, align 4
  %29 = load i32* %shift_size, align 4
  %30 = sub i32 0, 1
  %31 = xor i32 %29, %30
  %32 = and i32 %29, %30
  %33 = add i32 %32, %32
  %34 = add nsw i32 %31, %33
  %35 = sub nsw i32 %29, 1
  %36 = srem i32 %34, 8
  %37 = ashr i32 128, %36
  %38 = trunc i32 %37 to i8
  store i8 %38, i8* %shift_byte, align 1
  %39 = load i32* %shift_size, align 4
  %40 = sub i32 0, 1
  %41 = xor i32 %39, %40
  %42 = and i32 %39, %40
  %43 = add i32 %42, %42
  %44 = add nsw i32 %41, %43
  %45 = sub nsw i32 %39, 1
  %46 = sdiv i32 %44, 8
  %47 = sext i32 %46 to i64
  %48 = load i8** %1, align 8
  %49 = getelementptr inbounds i8* %48, i64 %47
  %50 = load i8* %49, align 1
  %51 = zext i8 %50 to i32
  %52 = load i8* %shift_byte, align 1
  %53 = zext i8 %52 to i32
  %54 = xor i32 1365131442, -1
  %55 = or i32 %53, 1365131442
  %56 = or i32 %51, 1365131442
  %57 = or i32 %53, %54
  %58 = or i32 %51, %54
  %59 = and i32 %55, %56
  %60 = and i32 %59, %57
  %61 = and i32 %60, %58
  %62 = and i32 %53, %51
  %63 = trunc i32 %61 to i8
  store i8 %63, i8* %shift_byte, align 1
  %64 = load i32* %shift_size, align 4
  %65 = sub i32 0, 1
  %66 = xor i32 %64, %65
  %67 = and i32 %64, %65
  %68 = add i32 %67, %67
  %69 = add nsw i32 %66, %68
  %70 = sub nsw i32 %64, 1
  %71 = srem i32 %69, 8
  %72 = load i8* %shift_byte, align 1
  %73 = zext i8 %72 to i32
  %74 = shl i32 %73, %71
  %75 = trunc i32 %74 to i8
  store i8 %75, i8* %shift_byte, align 1
  %76 = load i8* %shift_byte, align 1
  %77 = zext i8 %76 to i32
  %78 = load i32* %i, align 4
  %79 = srem i32 %78, 8
  %80 = ashr i32 %77, %79
  %81 = load i32* %i, align 4
  %82 = sdiv i32 %81, 8
  %83 = sext i32 %82 to i64
  %84 = load %struct.key_set** %2, align 8
  %85 = getelementptr inbounds %struct.key_set* %84, i64 0
  %86 = getelementptr inbounds %struct.key_set* %85, i32 0, i32 0
  %87 = getelementptr inbounds [8 x i8]* %86, i32 0, i64 %83
  %88 = load i8* %87, align 1
  %89 = zext i8 %88 to i32
  %90 = and i32 %89, %80
  %91 = xor i32 %89, %80
  %92 = or i32 %90, %91
  %93 = or i32 %89, %80
  %94 = trunc i32 %92 to i8
  store i8 %94, i8* %87, align 1
  br label %95

; <label>:95                                      ; preds = %24
  %96 = load i32* %i, align 4
  %97 = xor i32 %96, 1
  %98 = and i32 %96, 1
  %99 = add i32 %98, %98
  %100 = add nsw i32 %97, %99
  %101 = add nsw i32 %96, 1
  store i32 %100, i32* %i, align 4
  br label %21

; <label>:102                                     ; preds = %21
  store i32 0, i32* %i, align 4
  br label %103

; <label>:103                                     ; preds = %120, %102
  %104 = load i32* %i, align 4
  %105 = icmp slt i32 %104, 3
  br i1 %105, label %106, label %127

; <label>:106                                     ; preds = %103
  %107 = load i32* %i, align 4
  %108 = sext i32 %107 to i64
  %109 = load %struct.key_set** %2, align 8
  %110 = getelementptr inbounds %struct.key_set* %109, i64 0
  %111 = getelementptr inbounds %struct.key_set* %110, i32 0, i32 0
  %112 = getelementptr inbounds [8 x i8]* %111, i32 0, i64 %108
  %113 = load i8* %112, align 1
  %114 = load i32* %i, align 4
  %115 = sext i32 %114 to i64
  %116 = load %struct.key_set** %2, align 8
  %117 = getelementptr inbounds %struct.key_set* %116, i64 0
  %118 = getelementptr inbounds %struct.key_set* %117, i32 0, i32 1
  %119 = getelementptr inbounds [4 x i8]* %118, i32 0, i64 %115
  store i8 %113, i8* %119, align 1
  br label %120

; <label>:120                                     ; preds = %106
  %121 = load i32* %i, align 4
  %122 = xor i32 %121, 1
  %123 = and i32 %121, 1
  %124 = add i32 %123, %123
  %125 = add nsw i32 %122, %124
  %126 = add nsw i32 %121, 1
  store i32 %125, i32* %i, align 4
  br label %103

; <label>:127                                     ; preds = %103
  %128 = load %struct.key_set** %2, align 8
  %129 = getelementptr inbounds %struct.key_set* %128, i64 0
  %130 = getelementptr inbounds %struct.key_set* %129, i32 0, i32 0
  %131 = getelementptr inbounds [8 x i8]* %130, i32 0, i64 3
  %132 = load i8* %131, align 1
  %133 = zext i8 %132 to i32
  %134 = xor i32 1934838715, -1
  %135 = or i32 %133, 1934838715
  %136 = or i32 240, 1934838715
  %137 = or i32 %133, %134
  %138 = or i32 240, %134
  %139 = and i32 %135, %136
  %140 = and i32 %139, %137
  %141 = and i32 %140, %138
  %142 = and i32 %133, 240
  %143 = trunc i32 %141 to i8
  %144 = load %struct.key_set** %2, align 8
  %145 = getelementptr inbounds %struct.key_set* %144, i64 0
  %146 = getelementptr inbounds %struct.key_set* %145, i32 0, i32 1
  %147 = getelementptr inbounds [4 x i8]* %146, i32 0, i64 3
  store i8 %143, i8* %147, align 1
  store i32 0, i32* %i, align 4
  br label %148

; <label>:148                                     ; preds = %218, %127
  %149 = load i32* %i, align 4
  %150 = icmp slt i32 %149, 3
  br i1 %150, label %151, label %225

; <label>:151                                     ; preds = %148
  %152 = load i32* %i, align 4
  %153 = xor i32 %152, 3
  %154 = and i32 %152, 3
  %155 = add i32 %154, %154
  %156 = add nsw i32 %153, %155
  %157 = add nsw i32 %152, 3
  %158 = sext i32 %156 to i64
  %159 = load %struct.key_set** %2, align 8
  %160 = getelementptr inbounds %struct.key_set* %159, i64 0
  %161 = getelementptr inbounds %struct.key_set* %160, i32 0, i32 0
  %162 = getelementptr inbounds [8 x i8]* %161, i32 0, i64 %158
  %163 = load i8* %162, align 1
  %164 = zext i8 %163 to i32
  %165 = xor i32 -289108463, -1
  %166 = or i32 %164, -289108463
  %167 = or i32 15, -289108463
  %168 = or i32 %164, %165
  %169 = or i32 15, %165
  %170 = and i32 %166, %167
  %171 = and i32 %170, %168
  %172 = and i32 %171, %169
  %173 = and i32 %164, 15
  %174 = shl i32 %172, 4
  %175 = trunc i32 %174 to i8
  %176 = load i32* %i, align 4
  %177 = sext i32 %176 to i64
  %178 = load %struct.key_set** %2, align 8
  %179 = getelementptr inbounds %struct.key_set* %178, i64 0
  %180 = getelementptr inbounds %struct.key_set* %179, i32 0, i32 2
  %181 = getelementptr inbounds [4 x i8]* %180, i32 0, i64 %177
  store i8 %175, i8* %181, align 1
  %182 = load i32* %i, align 4
  %183 = xor i32 %182, 4
  %184 = and i32 %182, 4
  %185 = add i32 %184, %184
  %186 = add nsw i32 %183, %185
  %187 = add nsw i32 %182, 4
  %188 = sext i32 %186 to i64
  %189 = load %struct.key_set** %2, align 8
  %190 = getelementptr inbounds %struct.key_set* %189, i64 0
  %191 = getelementptr inbounds %struct.key_set* %190, i32 0, i32 0
  %192 = getelementptr inbounds [8 x i8]* %191, i32 0, i64 %188
  %193 = load i8* %192, align 1
  %194 = zext i8 %193 to i32
  %195 = xor i32 1886817121, -1
  %196 = or i32 %194, 1886817121
  %197 = or i32 240, 1886817121
  %198 = or i32 %194, %195
  %199 = or i32 240, %195
  %200 = and i32 %196, %197
  %201 = and i32 %200, %198
  %202 = and i32 %201, %199
  %203 = and i32 %194, 240
  %204 = ashr i32 %202, 4
  %205 = load i32* %i, align 4
  %206 = sext i32 %205 to i64
  %207 = load %struct.key_set** %2, align 8
  %208 = getelementptr inbounds %struct.key_set* %207, i64 0
  %209 = getelementptr inbounds %struct.key_set* %208, i32 0, i32 2
  %210 = getelementptr inbounds [4 x i8]* %209, i32 0, i64 %206
  %211 = load i8* %210, align 1
  %212 = zext i8 %211 to i32
  %213 = and i32 %212, %204
  %214 = xor i32 %212, %204
  %215 = or i32 %213, %214
  %216 = or i32 %212, %204
  %217 = trunc i32 %215 to i8
  store i8 %217, i8* %210, align 1
  br label %218

; <label>:218                                     ; preds = %151
  %219 = load i32* %i, align 4
  %220 = xor i32 %219, 1
  %221 = and i32 %219, 1
  %222 = add i32 %221, %221
  %223 = add nsw i32 %220, %222
  %224 = add nsw i32 %219, 1
  store i32 %223, i32* %i, align 4
  br label %148

; <label>:225                                     ; preds = %148
  %226 = load %struct.key_set** %2, align 8
  %227 = getelementptr inbounds %struct.key_set* %226, i64 0
  %228 = getelementptr inbounds %struct.key_set* %227, i32 0, i32 0
  %229 = getelementptr inbounds [8 x i8]* %228, i32 0, i64 6
  %230 = load i8* %229, align 1
  %231 = zext i8 %230 to i32
  %232 = xor i32 -129131428, -1
  %233 = or i32 %231, -129131428
  %234 = or i32 15, -129131428
  %235 = or i32 %231, %232
  %236 = or i32 15, %232
  %237 = and i32 %233, %234
  %238 = and i32 %237, %235
  %239 = and i32 %238, %236
  %240 = and i32 %231, 15
  %241 = shl i32 %239, 4
  %242 = trunc i32 %241 to i8
  %243 = load %struct.key_set** %2, align 8
  %244 = getelementptr inbounds %struct.key_set* %243, i64 0
  %245 = getelementptr inbounds %struct.key_set* %244, i32 0, i32 2
  %246 = getelementptr inbounds [4 x i8]* %245, i32 0, i64 3
  store i8 %242, i8* %246, align 1
  store i32 1, i32* %i, align 4
  br label %247

; <label>:247                                     ; preds = %918, %225
  %248 = load i32* %i, align 4
  %249 = icmp slt i32 %248, 17
  br i1 %249, label %250, label %925

; <label>:250                                     ; preds = %247
  store i32 0, i32* %j, align 4
  br label %251

; <label>:251                                     ; preds = %301, %250
  %252 = load i32* %j, align 4
  %253 = icmp slt i32 %252, 4
  br i1 %253, label %254, label %308

; <label>:254                                     ; preds = %251
  %255 = load i32* %j, align 4
  %256 = sext i32 %255 to i64
  %257 = load i32* %i, align 4
  %258 = sub i32 0, 1
  %259 = xor i32 %257, %258
  %260 = and i32 %257, %258
  %261 = add i32 %260, %260
  %262 = add nsw i32 %259, %261
  %263 = sub nsw i32 %257, 1
  %264 = sext i32 %262 to i64
  %265 = load %struct.key_set** %2, align 8
  %266 = getelementptr inbounds %struct.key_set* %265, i64 %264
  %267 = getelementptr inbounds %struct.key_set* %266, i32 0, i32 1
  %268 = getelementptr inbounds [4 x i8]* %267, i32 0, i64 %256
  %269 = load i8* %268, align 1
  %270 = load i32* %j, align 4
  %271 = sext i32 %270 to i64
  %272 = load i32* %i, align 4
  %273 = sext i32 %272 to i64
  %274 = load %struct.key_set** %2, align 8
  %275 = getelementptr inbounds %struct.key_set* %274, i64 %273
  %276 = getelementptr inbounds %struct.key_set* %275, i32 0, i32 1
  %277 = getelementptr inbounds [4 x i8]* %276, i32 0, i64 %271
  store i8 %269, i8* %277, align 1
  %278 = load i32* %j, align 4
  %279 = sext i32 %278 to i64
  %280 = load i32* %i, align 4
  %281 = sub i32 0, 1
  %282 = xor i32 %280, %281
  %283 = and i32 %280, %281
  %284 = add i32 %283, %283
  %285 = add nsw i32 %282, %284
  %286 = sub nsw i32 %280, 1
  %287 = sext i32 %285 to i64
  %288 = load %struct.key_set** %2, align 8
  %289 = getelementptr inbounds %struct.key_set* %288, i64 %287
  %290 = getelementptr inbounds %struct.key_set* %289, i32 0, i32 2
  %291 = getelementptr inbounds [4 x i8]* %290, i32 0, i64 %279
  %292 = load i8* %291, align 1
  %293 = load i32* %j, align 4
  %294 = sext i32 %293 to i64
  %295 = load i32* %i, align 4
  %296 = sext i32 %295 to i64
  %297 = load %struct.key_set** %2, align 8
  %298 = getelementptr inbounds %struct.key_set* %297, i64 %296
  %299 = getelementptr inbounds %struct.key_set* %298, i32 0, i32 2
  %300 = getelementptr inbounds [4 x i8]* %299, i32 0, i64 %294
  store i8 %292, i8* %300, align 1
  br label %301

; <label>:301                                     ; preds = %254
  %302 = load i32* %j, align 4
  %303 = xor i32 %302, 1
  %304 = and i32 %302, 1
  %305 = add i32 %304, %304
  %306 = add nsw i32 %303, %305
  %307 = add nsw i32 %302, 1
  store i32 %306, i32* %j, align 4
  br label %251

; <label>:308                                     ; preds = %251
  %309 = load i32* %i, align 4
  %310 = sext i32 %309 to i64
  %311 = getelementptr inbounds [17 x i32]* @key_shift_sizes, i32 0, i64 %310
  %312 = load i32* %311, align 4
  store i32 %312, i32* %shift_size, align 4
  %313 = load i32* %shift_size, align 4
  %314 = icmp eq i32 %313, 1
  br i1 %314, label %315, label %316

; <label>:315                                     ; preds = %308
  store i8 -128, i8* %shift_byte, align 1
  br label %317

; <label>:316                                     ; preds = %308
  store i8 -64, i8* %shift_byte, align 1
  br label %317

; <label>:317                                     ; preds = %316, %315
  %318 = load i8* %shift_byte, align 1
  %319 = zext i8 %318 to i32
  %320 = load i32* %i, align 4
  %321 = sext i32 %320 to i64
  %322 = load %struct.key_set** %2, align 8
  %323 = getelementptr inbounds %struct.key_set* %322, i64 %321
  %324 = getelementptr inbounds %struct.key_set* %323, i32 0, i32 1
  %325 = getelementptr inbounds [4 x i8]* %324, i32 0, i64 0
  %326 = load i8* %325, align 1
  %327 = zext i8 %326 to i32
  %328 = xor i32 -900436750, -1
  %329 = or i32 %319, -900436750
  %330 = or i32 %327, -900436750
  %331 = or i32 %319, %328
  %332 = or i32 %327, %328
  %333 = and i32 %329, %330
  %334 = and i32 %333, %331
  %335 = and i32 %334, %332
  %336 = and i32 %319, %327
  %337 = trunc i32 %335 to i8
  store i8 %337, i8* %first_shift_bits, align 1
  %338 = load i8* %shift_byte, align 1
  %339 = zext i8 %338 to i32
  %340 = load i32* %i, align 4
  %341 = sext i32 %340 to i64
  %342 = load %struct.key_set** %2, align 8
  %343 = getelementptr inbounds %struct.key_set* %342, i64 %341
  %344 = getelementptr inbounds %struct.key_set* %343, i32 0, i32 1
  %345 = getelementptr inbounds [4 x i8]* %344, i32 0, i64 1
  %346 = load i8* %345, align 1
  %347 = zext i8 %346 to i32
  %348 = xor i32 -547838605, -1
  %349 = or i32 %339, -547838605
  %350 = or i32 %347, -547838605
  %351 = or i32 %339, %348
  %352 = or i32 %347, %348
  %353 = and i32 %349, %350
  %354 = and i32 %353, %351
  %355 = and i32 %354, %352
  %356 = and i32 %339, %347
  %357 = trunc i32 %355 to i8
  store i8 %357, i8* %second_shift_bits, align 1
  %358 = load i8* %shift_byte, align 1
  %359 = zext i8 %358 to i32
  %360 = load i32* %i, align 4
  %361 = sext i32 %360 to i64
  %362 = load %struct.key_set** %2, align 8
  %363 = getelementptr inbounds %struct.key_set* %362, i64 %361
  %364 = getelementptr inbounds %struct.key_set* %363, i32 0, i32 1
  %365 = getelementptr inbounds [4 x i8]* %364, i32 0, i64 2
  %366 = load i8* %365, align 1
  %367 = zext i8 %366 to i32
  %368 = xor i32 -950837493, -1
  %369 = or i32 %359, -950837493
  %370 = or i32 %367, -950837493
  %371 = or i32 %359, %368
  %372 = or i32 %367, %368
  %373 = and i32 %369, %370
  %374 = and i32 %373, %371
  %375 = and i32 %374, %372
  %376 = and i32 %359, %367
  %377 = trunc i32 %375 to i8
  store i8 %377, i8* %third_shift_bits, align 1
  %378 = load i8* %shift_byte, align 1
  %379 = zext i8 %378 to i32
  %380 = load i32* %i, align 4
  %381 = sext i32 %380 to i64
  %382 = load %struct.key_set** %2, align 8
  %383 = getelementptr inbounds %struct.key_set* %382, i64 %381
  %384 = getelementptr inbounds %struct.key_set* %383, i32 0, i32 1
  %385 = getelementptr inbounds [4 x i8]* %384, i32 0, i64 3
  %386 = load i8* %385, align 1
  %387 = zext i8 %386 to i32
  %388 = xor i32 845237543, -1
  %389 = or i32 %379, 845237543
  %390 = or i32 %387, 845237543
  %391 = or i32 %379, %388
  %392 = or i32 %387, %388
  %393 = and i32 %389, %390
  %394 = and i32 %393, %391
  %395 = and i32 %394, %392
  %396 = and i32 %379, %387
  %397 = trunc i32 %395 to i8
  store i8 %397, i8* %fourth_shift_bits, align 1
  %398 = load i32* %shift_size, align 4
  %399 = load i32* %i, align 4
  %400 = sext i32 %399 to i64
  %401 = load %struct.key_set** %2, align 8
  %402 = getelementptr inbounds %struct.key_set* %401, i64 %400
  %403 = getelementptr inbounds %struct.key_set* %402, i32 0, i32 1
  %404 = getelementptr inbounds [4 x i8]* %403, i32 0, i64 0
  %405 = load i8* %404, align 1
  %406 = zext i8 %405 to i32
  %407 = shl i32 %406, %398
  %408 = trunc i32 %407 to i8
  store i8 %408, i8* %404, align 1
  %409 = load i8* %second_shift_bits, align 1
  %410 = zext i8 %409 to i32
  %411 = load i32* %shift_size, align 4
  %412 = sub i32 0, %411
  %413 = xor i32 8, %412
  %414 = and i32 8, %412
  %415 = add i32 %414, %414
  %416 = add nsw i32 %413, %415
  %417 = sub nsw i32 8, %411
  %418 = ashr i32 %410, %416
  %419 = load i32* %i, align 4
  %420 = sext i32 %419 to i64
  %421 = load %struct.key_set** %2, align 8
  %422 = getelementptr inbounds %struct.key_set* %421, i64 %420
  %423 = getelementptr inbounds %struct.key_set* %422, i32 0, i32 1
  %424 = getelementptr inbounds [4 x i8]* %423, i32 0, i64 0
  %425 = load i8* %424, align 1
  %426 = zext i8 %425 to i32
  %427 = and i32 %426, %418
  %428 = xor i32 %426, %418
  %429 = or i32 %427, %428
  %430 = or i32 %426, %418
  %431 = trunc i32 %429 to i8
  store i8 %431, i8* %424, align 1
  %432 = load i32* %shift_size, align 4
  %433 = load i32* %i, align 4
  %434 = sext i32 %433 to i64
  %435 = load %struct.key_set** %2, align 8
  %436 = getelementptr inbounds %struct.key_set* %435, i64 %434
  %437 = getelementptr inbounds %struct.key_set* %436, i32 0, i32 1
  %438 = getelementptr inbounds [4 x i8]* %437, i32 0, i64 1
  %439 = load i8* %438, align 1
  %440 = zext i8 %439 to i32
  %441 = shl i32 %440, %432
  %442 = trunc i32 %441 to i8
  store i8 %442, i8* %438, align 1
  %443 = load i8* %third_shift_bits, align 1
  %444 = zext i8 %443 to i32
  %445 = load i32* %shift_size, align 4
  %446 = sub i32 0, %445
  %447 = xor i32 8, %446
  %448 = and i32 8, %446
  %449 = add i32 %448, %448
  %450 = add nsw i32 %447, %449
  %451 = sub nsw i32 8, %445
  %452 = ashr i32 %444, %450
  %453 = load i32* %i, align 4
  %454 = sext i32 %453 to i64
  %455 = load %struct.key_set** %2, align 8
  %456 = getelementptr inbounds %struct.key_set* %455, i64 %454
  %457 = getelementptr inbounds %struct.key_set* %456, i32 0, i32 1
  %458 = getelementptr inbounds [4 x i8]* %457, i32 0, i64 1
  %459 = load i8* %458, align 1
  %460 = zext i8 %459 to i32
  %461 = and i32 %460, %452
  %462 = xor i32 %460, %452
  %463 = or i32 %461, %462
  %464 = or i32 %460, %452
  %465 = trunc i32 %463 to i8
  store i8 %465, i8* %458, align 1
  %466 = load i32* %shift_size, align 4
  %467 = load i32* %i, align 4
  %468 = sext i32 %467 to i64
  %469 = load %struct.key_set** %2, align 8
  %470 = getelementptr inbounds %struct.key_set* %469, i64 %468
  %471 = getelementptr inbounds %struct.key_set* %470, i32 0, i32 1
  %472 = getelementptr inbounds [4 x i8]* %471, i32 0, i64 2
  %473 = load i8* %472, align 1
  %474 = zext i8 %473 to i32
  %475 = shl i32 %474, %466
  %476 = trunc i32 %475 to i8
  store i8 %476, i8* %472, align 1
  %477 = load i8* %fourth_shift_bits, align 1
  %478 = zext i8 %477 to i32
  %479 = load i32* %shift_size, align 4
  %480 = sub i32 0, %479
  %481 = xor i32 8, %480
  %482 = and i32 8, %480
  %483 = add i32 %482, %482
  %484 = add nsw i32 %481, %483
  %485 = sub nsw i32 8, %479
  %486 = ashr i32 %478, %484
  %487 = load i32* %i, align 4
  %488 = sext i32 %487 to i64
  %489 = load %struct.key_set** %2, align 8
  %490 = getelementptr inbounds %struct.key_set* %489, i64 %488
  %491 = getelementptr inbounds %struct.key_set* %490, i32 0, i32 1
  %492 = getelementptr inbounds [4 x i8]* %491, i32 0, i64 2
  %493 = load i8* %492, align 1
  %494 = zext i8 %493 to i32
  %495 = and i32 %494, %486
  %496 = xor i32 %494, %486
  %497 = or i32 %495, %496
  %498 = or i32 %494, %486
  %499 = trunc i32 %497 to i8
  store i8 %499, i8* %492, align 1
  %500 = load i32* %shift_size, align 4
  %501 = load i32* %i, align 4
  %502 = sext i32 %501 to i64
  %503 = load %struct.key_set** %2, align 8
  %504 = getelementptr inbounds %struct.key_set* %503, i64 %502
  %505 = getelementptr inbounds %struct.key_set* %504, i32 0, i32 1
  %506 = getelementptr inbounds [4 x i8]* %505, i32 0, i64 3
  %507 = load i8* %506, align 1
  %508 = zext i8 %507 to i32
  %509 = shl i32 %508, %500
  %510 = trunc i32 %509 to i8
  store i8 %510, i8* %506, align 1
  %511 = load i8* %first_shift_bits, align 1
  %512 = zext i8 %511 to i32
  %513 = load i32* %shift_size, align 4
  %514 = sub i32 0, %513
  %515 = xor i32 4, %514
  %516 = and i32 4, %514
  %517 = add i32 %516, %516
  %518 = add nsw i32 %515, %517
  %519 = sub nsw i32 4, %513
  %520 = ashr i32 %512, %518
  %521 = load i32* %i, align 4
  %522 = sext i32 %521 to i64
  %523 = load %struct.key_set** %2, align 8
  %524 = getelementptr inbounds %struct.key_set* %523, i64 %522
  %525 = getelementptr inbounds %struct.key_set* %524, i32 0, i32 1
  %526 = getelementptr inbounds [4 x i8]* %525, i32 0, i64 3
  %527 = load i8* %526, align 1
  %528 = zext i8 %527 to i32
  %529 = and i32 %528, %520
  %530 = xor i32 %528, %520
  %531 = or i32 %529, %530
  %532 = or i32 %528, %520
  %533 = trunc i32 %531 to i8
  store i8 %533, i8* %526, align 1
  %534 = load i8* %shift_byte, align 1
  %535 = zext i8 %534 to i32
  %536 = load i32* %i, align 4
  %537 = sext i32 %536 to i64
  %538 = load %struct.key_set** %2, align 8
  %539 = getelementptr inbounds %struct.key_set* %538, i64 %537
  %540 = getelementptr inbounds %struct.key_set* %539, i32 0, i32 2
  %541 = getelementptr inbounds [4 x i8]* %540, i32 0, i64 0
  %542 = load i8* %541, align 1
  %543 = zext i8 %542 to i32
  %544 = xor i32 894337452, -1
  %545 = or i32 %535, 894337452
  %546 = or i32 %543, 894337452
  %547 = or i32 %535, %544
  %548 = or i32 %543, %544
  %549 = and i32 %545, %546
  %550 = and i32 %549, %547
  %551 = and i32 %550, %548
  %552 = and i32 %535, %543
  %553 = trunc i32 %551 to i8
  store i8 %553, i8* %first_shift_bits, align 1
  %554 = load i8* %shift_byte, align 1
  %555 = zext i8 %554 to i32
  %556 = load i32* %i, align 4
  %557 = sext i32 %556 to i64
  %558 = load %struct.key_set** %2, align 8
  %559 = getelementptr inbounds %struct.key_set* %558, i64 %557
  %560 = getelementptr inbounds %struct.key_set* %559, i32 0, i32 2
  %561 = getelementptr inbounds [4 x i8]* %560, i32 0, i64 1
  %562 = load i8* %561, align 1
  %563 = zext i8 %562 to i32
  %564 = xor i32 1245427447, -1
  %565 = or i32 %555, 1245427447
  %566 = or i32 %563, 1245427447
  %567 = or i32 %555, %564
  %568 = or i32 %563, %564
  %569 = and i32 %565, %566
  %570 = and i32 %569, %567
  %571 = and i32 %570, %568
  %572 = and i32 %555, %563
  %573 = trunc i32 %571 to i8
  store i8 %573, i8* %second_shift_bits, align 1
  %574 = load i8* %shift_byte, align 1
  %575 = zext i8 %574 to i32
  %576 = load i32* %i, align 4
  %577 = sext i32 %576 to i64
  %578 = load %struct.key_set** %2, align 8
  %579 = getelementptr inbounds %struct.key_set* %578, i64 %577
  %580 = getelementptr inbounds %struct.key_set* %579, i32 0, i32 2
  %581 = getelementptr inbounds [4 x i8]* %580, i32 0, i64 2
  %582 = load i8* %581, align 1
  %583 = zext i8 %582 to i32
  %584 = xor i32 -650084506, -1
  %585 = or i32 %575, -650084506
  %586 = or i32 %583, -650084506
  %587 = or i32 %575, %584
  %588 = or i32 %583, %584
  %589 = and i32 %585, %586
  %590 = and i32 %589, %587
  %591 = and i32 %590, %588
  %592 = and i32 %575, %583
  %593 = trunc i32 %591 to i8
  store i8 %593, i8* %third_shift_bits, align 1
  %594 = load i8* %shift_byte, align 1
  %595 = zext i8 %594 to i32
  %596 = load i32* %i, align 4
  %597 = sext i32 %596 to i64
  %598 = load %struct.key_set** %2, align 8
  %599 = getelementptr inbounds %struct.key_set* %598, i64 %597
  %600 = getelementptr inbounds %struct.key_set* %599, i32 0, i32 2
  %601 = getelementptr inbounds [4 x i8]* %600, i32 0, i64 3
  %602 = load i8* %601, align 1
  %603 = zext i8 %602 to i32
  %604 = xor i32 407567824, -1
  %605 = or i32 %595, 407567824
  %606 = or i32 %603, 407567824
  %607 = or i32 %595, %604
  %608 = or i32 %603, %604
  %609 = and i32 %605, %606
  %610 = and i32 %609, %607
  %611 = and i32 %610, %608
  %612 = and i32 %595, %603
  %613 = trunc i32 %611 to i8
  store i8 %613, i8* %fourth_shift_bits, align 1
  %614 = load i32* %shift_size, align 4
  %615 = load i32* %i, align 4
  %616 = sext i32 %615 to i64
  %617 = load %struct.key_set** %2, align 8
  %618 = getelementptr inbounds %struct.key_set* %617, i64 %616
  %619 = getelementptr inbounds %struct.key_set* %618, i32 0, i32 2
  %620 = getelementptr inbounds [4 x i8]* %619, i32 0, i64 0
  %621 = load i8* %620, align 1
  %622 = zext i8 %621 to i32
  %623 = shl i32 %622, %614
  %624 = trunc i32 %623 to i8
  store i8 %624, i8* %620, align 1
  %625 = load i8* %second_shift_bits, align 1
  %626 = zext i8 %625 to i32
  %627 = load i32* %shift_size, align 4
  %628 = sub i32 0, %627
  %629 = xor i32 8, %628
  %630 = and i32 8, %628
  %631 = add i32 %630, %630
  %632 = add nsw i32 %629, %631
  %633 = sub nsw i32 8, %627
  %634 = ashr i32 %626, %632
  %635 = load i32* %i, align 4
  %636 = sext i32 %635 to i64
  %637 = load %struct.key_set** %2, align 8
  %638 = getelementptr inbounds %struct.key_set* %637, i64 %636
  %639 = getelementptr inbounds %struct.key_set* %638, i32 0, i32 2
  %640 = getelementptr inbounds [4 x i8]* %639, i32 0, i64 0
  %641 = load i8* %640, align 1
  %642 = zext i8 %641 to i32
  %643 = xor i32 %642, -1
  %644 = xor i32 %634, -1
  %645 = xor i32 1125265898, -1
  %646 = and i32 %643, 1125265898
  %647 = and i32 %642, %645
  %648 = and i32 %644, 1125265898
  %649 = and i32 %634, %645
  %650 = or i32 %646, %647
  %651 = or i32 %648, %649
  %652 = xor i32 %650, %651
  %653 = or i32 %643, %644
  %654 = xor i32 %653, -1
  %655 = or i32 1125265898, %645
  %656 = and i32 %654, %655
  %657 = or i32 %652, %656
  %658 = or i32 %642, %634
  %659 = trunc i32 %657 to i8
  store i8 %659, i8* %640, align 1
  %660 = load i32* %shift_size, align 4
  %661 = load i32* %i, align 4
  %662 = sext i32 %661 to i64
  %663 = load %struct.key_set** %2, align 8
  %664 = getelementptr inbounds %struct.key_set* %663, i64 %662
  %665 = getelementptr inbounds %struct.key_set* %664, i32 0, i32 2
  %666 = getelementptr inbounds [4 x i8]* %665, i32 0, i64 1
  %667 = load i8* %666, align 1
  %668 = zext i8 %667 to i32
  %669 = shl i32 %668, %660
  %670 = trunc i32 %669 to i8
  store i8 %670, i8* %666, align 1
  %671 = load i8* %third_shift_bits, align 1
  %672 = zext i8 %671 to i32
  %673 = load i32* %shift_size, align 4
  %674 = sub i32 0, %673
  %675 = xor i32 8, %674
  %676 = and i32 8, %674
  %677 = add i32 %676, %676
  %678 = add nsw i32 %675, %677
  %679 = sub nsw i32 8, %673
  %680 = ashr i32 %672, %678
  %681 = load i32* %i, align 4
  %682 = sext i32 %681 to i64
  %683 = load %struct.key_set** %2, align 8
  %684 = getelementptr inbounds %struct.key_set* %683, i64 %682
  %685 = getelementptr inbounds %struct.key_set* %684, i32 0, i32 2
  %686 = getelementptr inbounds [4 x i8]* %685, i32 0, i64 1
  %687 = load i8* %686, align 1
  %688 = zext i8 %687 to i32
  %689 = and i32 %688, %680
  %690 = xor i32 %688, %680
  %691 = or i32 %689, %690
  %692 = or i32 %688, %680
  %693 = trunc i32 %691 to i8
  store i8 %693, i8* %686, align 1
  %694 = load i32* %shift_size, align 4
  %695 = load i32* %i, align 4
  %696 = sext i32 %695 to i64
  %697 = load %struct.key_set** %2, align 8
  %698 = getelementptr inbounds %struct.key_set* %697, i64 %696
  %699 = getelementptr inbounds %struct.key_set* %698, i32 0, i32 2
  %700 = getelementptr inbounds [4 x i8]* %699, i32 0, i64 2
  %701 = load i8* %700, align 1
  %702 = zext i8 %701 to i32
  %703 = shl i32 %702, %694
  %704 = trunc i32 %703 to i8
  store i8 %704, i8* %700, align 1
  %705 = load i8* %fourth_shift_bits, align 1
  %706 = zext i8 %705 to i32
  %707 = load i32* %shift_size, align 4
  %708 = sub i32 0, %707
  %709 = xor i32 8, %708
  %710 = and i32 8, %708
  %711 = add i32 %710, %710
  %712 = add nsw i32 %709, %711
  %713 = sub nsw i32 8, %707
  %714 = ashr i32 %706, %712
  %715 = load i32* %i, align 4
  %716 = sext i32 %715 to i64
  %717 = load %struct.key_set** %2, align 8
  %718 = getelementptr inbounds %struct.key_set* %717, i64 %716
  %719 = getelementptr inbounds %struct.key_set* %718, i32 0, i32 2
  %720 = getelementptr inbounds [4 x i8]* %719, i32 0, i64 2
  %721 = load i8* %720, align 1
  %722 = zext i8 %721 to i32
  %723 = xor i32 %722, -1
  %724 = xor i32 %714, -1
  %725 = xor i32 1874242031, -1
  %726 = and i32 %723, 1874242031
  %727 = and i32 %722, %725
  %728 = and i32 %724, 1874242031
  %729 = and i32 %714, %725
  %730 = or i32 %726, %727
  %731 = or i32 %728, %729
  %732 = xor i32 %730, %731
  %733 = or i32 %723, %724
  %734 = xor i32 %733, -1
  %735 = or i32 1874242031, %725
  %736 = and i32 %734, %735
  %737 = or i32 %732, %736
  %738 = or i32 %722, %714
  %739 = trunc i32 %737 to i8
  store i8 %739, i8* %720, align 1
  %740 = load i32* %shift_size, align 4
  %741 = load i32* %i, align 4
  %742 = sext i32 %741 to i64
  %743 = load %struct.key_set** %2, align 8
  %744 = getelementptr inbounds %struct.key_set* %743, i64 %742
  %745 = getelementptr inbounds %struct.key_set* %744, i32 0, i32 2
  %746 = getelementptr inbounds [4 x i8]* %745, i32 0, i64 3
  %747 = load i8* %746, align 1
  %748 = zext i8 %747 to i32
  %749 = shl i32 %748, %740
  %750 = trunc i32 %749 to i8
  store i8 %750, i8* %746, align 1
  %751 = load i8* %first_shift_bits, align 1
  %752 = zext i8 %751 to i32
  %753 = load i32* %shift_size, align 4
  %754 = sub i32 0, %753
  %755 = xor i32 4, %754
  %756 = and i32 4, %754
  %757 = add i32 %756, %756
  %758 = add nsw i32 %755, %757
  %759 = sub nsw i32 4, %753
  %760 = ashr i32 %752, %758
  %761 = load i32* %i, align 4
  %762 = sext i32 %761 to i64
  %763 = load %struct.key_set** %2, align 8
  %764 = getelementptr inbounds %struct.key_set* %763, i64 %762
  %765 = getelementptr inbounds %struct.key_set* %764, i32 0, i32 2
  %766 = getelementptr inbounds [4 x i8]* %765, i32 0, i64 3
  %767 = load i8* %766, align 1
  %768 = zext i8 %767 to i32
  %769 = and i32 %768, %760
  %770 = xor i32 %768, %760
  %771 = or i32 %769, %770
  %772 = or i32 %768, %760
  %773 = trunc i32 %771 to i8
  store i8 %773, i8* %766, align 1
  store i32 0, i32* %j, align 4
  br label %774

; <label>:774                                     ; preds = %910, %317
  %775 = load i32* %j, align 4
  %776 = icmp slt i32 %775, 48
  br i1 %776, label %777, label %917

; <label>:777                                     ; preds = %774
  %778 = load i32* %j, align 4
  %779 = sext i32 %778 to i64
  %780 = getelementptr inbounds [48 x i32]* @sub_key_permutation, i32 0, i64 %779
  %781 = load i32* %780, align 4
  store i32 %781, i32* %shift_size, align 4
  %782 = load i32* %shift_size, align 4
  %783 = icmp sle i32 %782, 28
  br i1 %783, label %784, label %836

; <label>:784                                     ; preds = %777
  %785 = load i32* %shift_size, align 4
  %786 = sub i32 0, 1
  %787 = xor i32 %785, %786
  %788 = and i32 %785, %786
  %789 = add i32 %788, %788
  %790 = add nsw i32 %787, %789
  %791 = sub nsw i32 %785, 1
  %792 = srem i32 %790, 8
  %793 = ashr i32 128, %792
  %794 = trunc i32 %793 to i8
  store i8 %794, i8* %shift_byte, align 1
  %795 = load i32* %shift_size, align 4
  %796 = sub i32 0, 1
  %797 = xor i32 %795, %796
  %798 = and i32 %795, %796
  %799 = add i32 %798, %798
  %800 = add nsw i32 %797, %799
  %801 = sub nsw i32 %795, 1
  %802 = sdiv i32 %800, 8
  %803 = sext i32 %802 to i64
  %804 = load i32* %i, align 4
  %805 = sext i32 %804 to i64
  %806 = load %struct.key_set** %2, align 8
  %807 = getelementptr inbounds %struct.key_set* %806, i64 %805
  %808 = getelementptr inbounds %struct.key_set* %807, i32 0, i32 1
  %809 = getelementptr inbounds [4 x i8]* %808, i32 0, i64 %803
  %810 = load i8* %809, align 1
  %811 = zext i8 %810 to i32
  %812 = load i8* %shift_byte, align 1
  %813 = zext i8 %812 to i32
  %814 = xor i32 812517821, -1
  %815 = or i32 %813, 812517821
  %816 = or i32 %811, 812517821
  %817 = or i32 %813, %814
  %818 = or i32 %811, %814
  %819 = and i32 %815, %816
  %820 = and i32 %819, %817
  %821 = and i32 %820, %818
  %822 = and i32 %813, %811
  %823 = trunc i32 %821 to i8
  store i8 %823, i8* %shift_byte, align 1
  %824 = load i32* %shift_size, align 4
  %825 = sub i32 0, 1
  %826 = xor i32 %824, %825
  %827 = and i32 %824, %825
  %828 = add i32 %827, %827
  %829 = add nsw i32 %826, %828
  %830 = sub nsw i32 %824, 1
  %831 = srem i32 %829, 8
  %832 = load i8* %shift_byte, align 1
  %833 = zext i8 %832 to i32
  %834 = shl i32 %833, %831
  %835 = trunc i32 %834 to i8
  store i8 %835, i8* %shift_byte, align 1
  br label %888

; <label>:836                                     ; preds = %777
  %837 = load i32* %shift_size, align 4
  %838 = sub i32 0, 29
  %839 = xor i32 %837, %838
  %840 = and i32 %837, %838
  %841 = add i32 %840, %840
  %842 = add nsw i32 %839, %841
  %843 = sub nsw i32 %837, 29
  %844 = srem i32 %842, 8
  %845 = ashr i32 128, %844
  %846 = trunc i32 %845 to i8
  store i8 %846, i8* %shift_byte, align 1
  %847 = load i32* %shift_size, align 4
  %848 = sub i32 0, 29
  %849 = xor i32 %847, %848
  %850 = and i32 %847, %848
  %851 = add i32 %850, %850
  %852 = add nsw i32 %849, %851
  %853 = sub nsw i32 %847, 29
  %854 = sdiv i32 %852, 8
  %855 = sext i32 %854 to i64
  %856 = load i32* %i, align 4
  %857 = sext i32 %856 to i64
  %858 = load %struct.key_set** %2, align 8
  %859 = getelementptr inbounds %struct.key_set* %858, i64 %857
  %860 = getelementptr inbounds %struct.key_set* %859, i32 0, i32 2
  %861 = getelementptr inbounds [4 x i8]* %860, i32 0, i64 %855
  %862 = load i8* %861, align 1
  %863 = zext i8 %862 to i32
  %864 = load i8* %shift_byte, align 1
  %865 = zext i8 %864 to i32
  %866 = xor i32 2084677335, -1
  %867 = or i32 %865, 2084677335
  %868 = or i32 %863, 2084677335
  %869 = or i32 %865, %866
  %870 = or i32 %863, %866
  %871 = and i32 %867, %868
  %872 = and i32 %871, %869
  %873 = and i32 %872, %870
  %874 = and i32 %865, %863
  %875 = trunc i32 %873 to i8
  store i8 %875, i8* %shift_byte, align 1
  %876 = load i32* %shift_size, align 4
  %877 = sub i32 0, 29
  %878 = xor i32 %876, %877
  %879 = and i32 %876, %877
  %880 = add i32 %879, %879
  %881 = add nsw i32 %878, %880
  %882 = sub nsw i32 %876, 29
  %883 = srem i32 %881, 8
  %884 = load i8* %shift_byte, align 1
  %885 = zext i8 %884 to i32
  %886 = shl i32 %885, %883
  %887 = trunc i32 %886 to i8
  store i8 %887, i8* %shift_byte, align 1
  br label %888

; <label>:888                                     ; preds = %836, %784
  %889 = load i8* %shift_byte, align 1
  %890 = zext i8 %889 to i32
  %891 = load i32* %j, align 4
  %892 = srem i32 %891, 8
  %893 = ashr i32 %890, %892
  %894 = load i32* %j, align 4
  %895 = sdiv i32 %894, 8
  %896 = sext i32 %895 to i64
  %897 = load i32* %i, align 4
  %898 = sext i32 %897 to i64
  %899 = load %struct.key_set** %2, align 8
  %900 = getelementptr inbounds %struct.key_set* %899, i64 %898
  %901 = getelementptr inbounds %struct.key_set* %900, i32 0, i32 0
  %902 = getelementptr inbounds [8 x i8]* %901, i32 0, i64 %896
  %903 = load i8* %902, align 1
  %904 = zext i8 %903 to i32
  %905 = and i32 %904, %893
  %906 = xor i32 %904, %893
  %907 = or i32 %905, %906
  %908 = or i32 %904, %893
  %909 = trunc i32 %907 to i8
  store i8 %909, i8* %902, align 1
  br label %910

; <label>:910                                     ; preds = %888
  %911 = load i32* %j, align 4
  %912 = xor i32 %911, 1
  %913 = and i32 %911, 1
  %914 = add i32 %913, %913
  %915 = add nsw i32 %912, %914
  %916 = add nsw i32 %911, 1
  store i32 %915, i32* %j, align 4
  br label %774

; <label>:917                                     ; preds = %774
  br label %918

; <label>:918                                     ; preds = %917
  %919 = load i32* %i, align 4
  %920 = xor i32 %919, 1
  %921 = and i32 %919, 1
  %922 = add i32 %921, %921
  %923 = add nsw i32 %920, %922
  %924 = add nsw i32 %919, 1
  store i32 %923, i32* %i, align 4
  br label %247

; <label>:925                                     ; preds = %247
  ret void
}

; Function Attrs: nounwind uwtable
define void @process_message(i8* %message_piece, i8* %processed_piece, %struct.key_set* %key_sets, i32 %mode) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i8*, align 8
  %3 = alloca %struct.key_set*, align 8
  %4 = alloca i32, align 4
  %i = alloca i32, align 4
  %k = alloca i32, align 4
  %shift_size = alloca i32, align 4
  %shift_byte = alloca i8, align 1
  %initial_permutation = alloca [8 x i8], align 1
  %l = alloca [4 x i8], align 1
  %r = alloca [4 x i8], align 1
  %ln = alloca [4 x i8], align 1
  %rn = alloca [4 x i8], align 1
  %er = alloca [6 x i8], align 1
  %ser = alloca [4 x i8], align 1
  %key_index = alloca i32, align 4
  %row = alloca i8, align 1
  %column = alloca i8, align 1
  %pre_end_permutation = alloca [8 x i8], align 1
  store i8* %message_piece, i8** %1, align 8
  store i8* %processed_piece, i8** %2, align 8
  store %struct.key_set* %key_sets, %struct.key_set** %3, align 8
  store i32 %mode, i32* %4, align 4
  %5 = bitcast [8 x i8]* %initial_permutation to i8*
  call void @llvm.memset.p0i8.i64(i8* %5, i8 0, i64 8, i32 1, i1 false)
  %6 = load i8** %2, align 8
  call void @llvm.memset.p0i8.i64(i8* %6, i8 0, i64 8, i32 1, i1 false)
  store i32 0, i32* %i, align 4
  br label %7

; <label>:7                                       ; preds = %78, %0
  %8 = load i32* %i, align 4
  %9 = icmp slt i32 %8, 64
  br i1 %9, label %10, label %85

; <label>:10                                      ; preds = %7
  %11 = load i32* %i, align 4
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds [64 x i32]* @initial_message_permutation, i32 0, i64 %12
  %14 = load i32* %13, align 4
  store i32 %14, i32* %shift_size, align 4
  %15 = load i32* %shift_size, align 4
  %16 = sub i32 0, 1
  %17 = xor i32 %15, %16
  %18 = and i32 %15, %16
  %19 = add i32 %18, %18
  %20 = add nsw i32 %17, %19
  %21 = sub nsw i32 %15, 1
  %22 = srem i32 %20, 8
  %23 = ashr i32 128, %22
  %24 = trunc i32 %23 to i8
  store i8 %24, i8* %shift_byte, align 1
  %25 = load i32* %shift_size, align 4
  %26 = sub i32 0, 1
  %27 = xor i32 %25, %26
  %28 = and i32 %25, %26
  %29 = add i32 %28, %28
  %30 = add nsw i32 %27, %29
  %31 = sub nsw i32 %25, 1
  %32 = sdiv i32 %30, 8
  %33 = sext i32 %32 to i64
  %34 = load i8** %1, align 8
  %35 = getelementptr inbounds i8* %34, i64 %33
  %36 = load i8* %35, align 1
  %37 = zext i8 %36 to i32
  %38 = load i8* %shift_byte, align 1
  %39 = zext i8 %38 to i32
  %40 = xor i32 -579876832, -1
  %41 = or i32 %39, -579876832
  %42 = or i32 %37, -579876832
  %43 = or i32 %39, %40
  %44 = or i32 %37, %40
  %45 = and i32 %41, %42
  %46 = and i32 %45, %43
  %47 = and i32 %46, %44
  %48 = and i32 %39, %37
  %49 = trunc i32 %47 to i8
  store i8 %49, i8* %shift_byte, align 1
  %50 = load i32* %shift_size, align 4
  %51 = sub i32 0, 1
  %52 = xor i32 %50, %51
  %53 = and i32 %50, %51
  %54 = add i32 %53, %53
  %55 = add nsw i32 %52, %54
  %56 = sub nsw i32 %50, 1
  %57 = srem i32 %55, 8
  %58 = load i8* %shift_byte, align 1
  %59 = zext i8 %58 to i32
  %60 = shl i32 %59, %57
  %61 = trunc i32 %60 to i8
  store i8 %61, i8* %shift_byte, align 1
  %62 = load i8* %shift_byte, align 1
  %63 = zext i8 %62 to i32
  %64 = load i32* %i, align 4
  %65 = srem i32 %64, 8
  %66 = ashr i32 %63, %65
  %67 = load i32* %i, align 4
  %68 = sdiv i32 %67, 8
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds [8 x i8]* %initial_permutation, i32 0, i64 %69
  %71 = load i8* %70, align 1
  %72 = zext i8 %71 to i32
  %73 = and i32 %72, %66
  %74 = xor i32 %72, %66
  %75 = or i32 %73, %74
  %76 = or i32 %72, %66
  %77 = trunc i32 %75 to i8
  store i8 %77, i8* %70, align 1
  br label %78

; <label>:78                                      ; preds = %10
  %79 = load i32* %i, align 4
  %80 = xor i32 %79, 1
  %81 = and i32 %79, 1
  %82 = add i32 %81, %81
  %83 = add nsw i32 %80, %82
  %84 = add nsw i32 %79, 1
  store i32 %83, i32* %i, align 4
  br label %7

; <label>:85                                      ; preds = %7
  store i32 0, i32* %i, align 4
  br label %86

; <label>:86                                      ; preds = %109, %85
  %87 = load i32* %i, align 4
  %88 = icmp slt i32 %87, 4
  br i1 %88, label %89, label %116

; <label>:89                                      ; preds = %86
  %90 = load i32* %i, align 4
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds [8 x i8]* %initial_permutation, i32 0, i64 %91
  %93 = load i8* %92, align 1
  %94 = load i32* %i, align 4
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds [4 x i8]* %l, i32 0, i64 %95
  store i8 %93, i8* %96, align 1
  %97 = load i32* %i, align 4
  %98 = xor i32 %97, 4
  %99 = and i32 %97, 4
  %100 = add i32 %99, %99
  %101 = add nsw i32 %98, %100
  %102 = add nsw i32 %97, 4
  %103 = sext i32 %101 to i64
  %104 = getelementptr inbounds [8 x i8]* %initial_permutation, i32 0, i64 %103
  %105 = load i8* %104, align 1
  %106 = load i32* %i, align 4
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds [4 x i8]* %r, i32 0, i64 %107
  store i8 %105, i8* %108, align 1
  br label %109

; <label>:109                                     ; preds = %89
  %110 = load i32* %i, align 4
  %111 = xor i32 %110, 1
  %112 = and i32 %110, 1
  %113 = add i32 %112, %112
  %114 = add nsw i32 %111, %113
  %115 = add nsw i32 %110, 1
  store i32 %114, i32* %i, align 4
  br label %86

; <label>:116                                     ; preds = %86
  store i32 1, i32* %k, align 4
  br label %117

; <label>:117                                     ; preds = %1406, %116
  %118 = load i32* %k, align 4
  %119 = icmp sle i32 %118, 16
  br i1 %119, label %120, label %1413

; <label>:120                                     ; preds = %117
  %121 = bitcast [4 x i8]* %ln to i8*
  %122 = bitcast [4 x i8]* %r to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %121, i8* %122, i64 4, i32 1, i1 false)
  %123 = bitcast [6 x i8]* %er to i8*
  call void @llvm.memset.p0i8.i64(i8* %123, i8 0, i64 6, i32 1, i1 false)
  store i32 0, i32* %i, align 4
  br label %124

; <label>:124                                     ; preds = %206, %120
  %125 = load i32* %i, align 4
  %126 = icmp slt i32 %125, 48
  br i1 %126, label %127, label %213

; <label>:127                                     ; preds = %124
  %128 = load i32* %i, align 4
  %129 = sext i32 %128 to i64
  %130 = getelementptr inbounds [48 x i32]* @message_expansion, i32 0, i64 %129
  %131 = load i32* %130, align 4
  store i32 %131, i32* %shift_size, align 4
  %132 = load i32* %shift_size, align 4
  %133 = sub i32 0, 1
  %134 = xor i32 %132, %133
  %135 = and i32 %132, %133
  %136 = add i32 %135, %135
  %137 = add nsw i32 %134, %136
  %138 = sub nsw i32 %132, 1
  %139 = srem i32 %137, 8
  %140 = ashr i32 128, %139
  %141 = trunc i32 %140 to i8
  store i8 %141, i8* %shift_byte, align 1
  %142 = load i32* %shift_size, align 4
  %143 = sub i32 0, 1
  %144 = xor i32 %142, %143
  %145 = and i32 %142, %143
  %146 = add i32 %145, %145
  %147 = add nsw i32 %144, %146
  %148 = sub nsw i32 %142, 1
  %149 = sdiv i32 %147, 8
  %150 = sext i32 %149 to i64
  %151 = getelementptr inbounds [4 x i8]* %r, i32 0, i64 %150
  %152 = load i8* %151, align 1
  %153 = zext i8 %152 to i32
  %154 = load i8* %shift_byte, align 1
  %155 = zext i8 %154 to i32
  %156 = xor i32 1523549715, -1
  %157 = or i32 %155, 1523549715
  %158 = or i32 %153, 1523549715
  %159 = or i32 %155, %156
  %160 = or i32 %153, %156
  %161 = and i32 %157, %158
  %162 = and i32 %161, %159
  %163 = and i32 %162, %160
  %164 = and i32 %155, %153
  %165 = trunc i32 %163 to i8
  store i8 %165, i8* %shift_byte, align 1
  %166 = load i32* %shift_size, align 4
  %167 = sub i32 0, 1
  %168 = xor i32 %166, %167
  %169 = and i32 %166, %167
  %170 = add i32 %169, %169
  %171 = add nsw i32 %168, %170
  %172 = sub nsw i32 %166, 1
  %173 = srem i32 %171, 8
  %174 = load i8* %shift_byte, align 1
  %175 = zext i8 %174 to i32
  %176 = shl i32 %175, %173
  %177 = trunc i32 %176 to i8
  store i8 %177, i8* %shift_byte, align 1
  %178 = load i8* %shift_byte, align 1
  %179 = zext i8 %178 to i32
  %180 = load i32* %i, align 4
  %181 = srem i32 %180, 8
  %182 = ashr i32 %179, %181
  %183 = load i32* %i, align 4
  %184 = sdiv i32 %183, 8
  %185 = sext i32 %184 to i64
  %186 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 %185
  %187 = load i8* %186, align 1
  %188 = zext i8 %187 to i32
  %189 = xor i32 %188, -1
  %190 = xor i32 %182, -1
  %191 = xor i32 -1670529661, -1
  %192 = and i32 %189, -1670529661
  %193 = and i32 %188, %191
  %194 = and i32 %190, -1670529661
  %195 = and i32 %182, %191
  %196 = or i32 %192, %193
  %197 = or i32 %194, %195
  %198 = xor i32 %196, %197
  %199 = or i32 %189, %190
  %200 = xor i32 %199, -1
  %201 = or i32 -1670529661, %191
  %202 = and i32 %200, %201
  %203 = or i32 %198, %202
  %204 = or i32 %188, %182
  %205 = trunc i32 %203 to i8
  store i8 %205, i8* %186, align 1
  br label %206

; <label>:206                                     ; preds = %127
  %207 = load i32* %i, align 4
  %208 = xor i32 %207, 1
  %209 = and i32 %207, 1
  %210 = add i32 %209, %209
  %211 = add nsw i32 %208, %210
  %212 = add nsw i32 %207, 1
  store i32 %211, i32* %i, align 4
  br label %124

; <label>:213                                     ; preds = %124
  %214 = load i32* %4, align 4
  %215 = icmp eq i32 %214, 0
  br i1 %215, label %216, label %224

; <label>:216                                     ; preds = %213
  %217 = load i32* %k, align 4
  %218 = sub i32 0, %217
  %219 = xor i32 17, %218
  %220 = and i32 17, %218
  %221 = add i32 %220, %220
  %222 = add nsw i32 %219, %221
  %223 = sub nsw i32 17, %217
  store i32 %222, i32* %key_index, align 4
  br label %226

; <label>:224                                     ; preds = %213
  %225 = load i32* %k, align 4
  store i32 %225, i32* %key_index, align 4
  br label %226

; <label>:226                                     ; preds = %224, %216
  store i32 0, i32* %i, align 4
  br label %227

; <label>:227                                     ; preds = %252, %226
  %228 = load i32* %i, align 4
  %229 = icmp slt i32 %228, 6
  br i1 %229, label %230, label %259

; <label>:230                                     ; preds = %227
  %231 = load i32* %i, align 4
  %232 = sext i32 %231 to i64
  %233 = load i32* %key_index, align 4
  %234 = sext i32 %233 to i64
  %235 = load %struct.key_set** %3, align 8
  %236 = getelementptr inbounds %struct.key_set* %235, i64 %234
  %237 = getelementptr inbounds %struct.key_set* %236, i32 0, i32 0
  %238 = getelementptr inbounds [8 x i8]* %237, i32 0, i64 %232
  %239 = load i8* %238, align 1
  %240 = zext i8 %239 to i32
  %241 = load i32* %i, align 4
  %242 = sext i32 %241 to i64
  %243 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 %242
  %244 = load i8* %243, align 1
  %245 = zext i8 %244 to i32
  %246 = and i32 %245, %240
  %247 = add i32 %246, %246
  %248 = add i32 %245, %240
  %249 = sub i32 %248, %247
  %250 = xor i32 %245, %240
  %251 = trunc i32 %249 to i8
  store i8 %251, i8* %243, align 1
  br label %252

; <label>:252                                     ; preds = %230
  %253 = load i32* %i, align 4
  %254 = xor i32 %253, 1
  %255 = and i32 %253, 1
  %256 = add i32 %255, %255
  %257 = add nsw i32 %254, %256
  %258 = add nsw i32 %253, 1
  store i32 %257, i32* %i, align 4
  br label %227

; <label>:259                                     ; preds = %227
  store i32 0, i32* %i, align 4
  br label %260

; <label>:260                                     ; preds = %267, %259
  %261 = load i32* %i, align 4
  %262 = icmp slt i32 %261, 4
  br i1 %262, label %263, label %274

; <label>:263                                     ; preds = %260
  %264 = load i32* %i, align 4
  %265 = sext i32 %264 to i64
  %266 = getelementptr inbounds [4 x i8]* %ser, i32 0, i64 %265
  store i8 0, i8* %266, align 1
  br label %267

; <label>:267                                     ; preds = %263
  %268 = load i32* %i, align 4
  %269 = xor i32 %268, 1
  %270 = and i32 %268, 1
  %271 = add i32 %270, %270
  %272 = add nsw i32 %269, %271
  %273 = add nsw i32 %268, 1
  store i32 %272, i32* %i, align 4
  br label %260

; <label>:274                                     ; preds = %260
  store i8 0, i8* %row, align 1
  %275 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 0
  %276 = load i8* %275, align 1
  %277 = zext i8 %276 to i32
  %278 = xor i32 -1213214054, -1
  %279 = or i32 %277, -1213214054
  %280 = or i32 128, -1213214054
  %281 = or i32 %277, %278
  %282 = or i32 128, %278
  %283 = and i32 %279, %280
  %284 = and i32 %283, %281
  %285 = and i32 %284, %282
  %286 = and i32 %277, 128
  %287 = ashr i32 %285, 6
  %288 = load i8* %row, align 1
  %289 = zext i8 %288 to i32
  %290 = and i32 %289, %287
  %291 = xor i32 %289, %287
  %292 = or i32 %290, %291
  %293 = or i32 %289, %287
  %294 = trunc i32 %292 to i8
  store i8 %294, i8* %row, align 1
  %295 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 0
  %296 = load i8* %295, align 1
  %297 = zext i8 %296 to i32
  %298 = xor i32 517177194, -1
  %299 = or i32 %297, 517177194
  %300 = or i32 4, 517177194
  %301 = or i32 %297, %298
  %302 = or i32 4, %298
  %303 = and i32 %299, %300
  %304 = and i32 %303, %301
  %305 = and i32 %304, %302
  %306 = and i32 %297, 4
  %307 = ashr i32 %305, 2
  %308 = load i8* %row, align 1
  %309 = zext i8 %308 to i32
  %310 = and i32 %309, %307
  %311 = xor i32 %309, %307
  %312 = or i32 %310, %311
  %313 = or i32 %309, %307
  %314 = trunc i32 %312 to i8
  store i8 %314, i8* %row, align 1
  store i8 0, i8* %column, align 1
  %315 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 0
  %316 = load i8* %315, align 1
  %317 = zext i8 %316 to i32
  %318 = xor i32 -1337256811, -1
  %319 = or i32 %317, -1337256811
  %320 = or i32 120, -1337256811
  %321 = or i32 %317, %318
  %322 = or i32 120, %318
  %323 = and i32 %319, %320
  %324 = and i32 %323, %321
  %325 = and i32 %324, %322
  %326 = and i32 %317, 120
  %327 = ashr i32 %325, 3
  %328 = load i8* %column, align 1
  %329 = zext i8 %328 to i32
  %330 = xor i32 %329, -1
  %331 = xor i32 %327, -1
  %332 = xor i32 -2122435309, -1
  %333 = and i32 %330, -2122435309
  %334 = and i32 %329, %332
  %335 = and i32 %331, -2122435309
  %336 = and i32 %327, %332
  %337 = or i32 %333, %334
  %338 = or i32 %335, %336
  %339 = xor i32 %337, %338
  %340 = or i32 %330, %331
  %341 = xor i32 %340, -1
  %342 = or i32 -2122435309, %332
  %343 = and i32 %341, %342
  %344 = or i32 %339, %343
  %345 = or i32 %329, %327
  %346 = trunc i32 %344 to i8
  store i8 %346, i8* %column, align 1
  %347 = load i8* %row, align 1
  %348 = zext i8 %347 to i32
  %349 = mul nsw i32 %348, 16
  %350 = load i8* %column, align 1
  %351 = zext i8 %350 to i32
  %352 = xor i32 %349, %351
  %353 = and i32 %349, %351
  %354 = add i32 %353, %353
  %355 = add nsw i32 %352, %354
  %356 = add nsw i32 %349, %351
  %357 = sext i32 %355 to i64
  %358 = getelementptr inbounds [64 x i32]* @S1, i32 0, i64 %357
  %359 = load i32* %358, align 4
  %360 = trunc i32 %359 to i8
  %361 = zext i8 %360 to i32
  %362 = shl i32 %361, 4
  %363 = getelementptr inbounds [4 x i8]* %ser, i32 0, i64 0
  %364 = load i8* %363, align 1
  %365 = zext i8 %364 to i32
  %366 = xor i32 %365, -1
  %367 = xor i32 %362, -1
  %368 = xor i32 1377872430, -1
  %369 = and i32 %366, 1377872430
  %370 = and i32 %365, %368
  %371 = and i32 %367, 1377872430
  %372 = and i32 %362, %368
  %373 = or i32 %369, %370
  %374 = or i32 %371, %372
  %375 = xor i32 %373, %374
  %376 = or i32 %366, %367
  %377 = xor i32 %376, -1
  %378 = or i32 1377872430, %368
  %379 = and i32 %377, %378
  %380 = or i32 %375, %379
  %381 = or i32 %365, %362
  %382 = trunc i32 %380 to i8
  store i8 %382, i8* %363, align 1
  store i8 0, i8* %row, align 1
  %383 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 0
  %384 = load i8* %383, align 1
  %385 = zext i8 %384 to i32
  %386 = xor i32 1046772487, -1
  %387 = or i32 %385, 1046772487
  %388 = or i32 2, 1046772487
  %389 = or i32 %385, %386
  %390 = or i32 2, %386
  %391 = and i32 %387, %388
  %392 = and i32 %391, %389
  %393 = and i32 %392, %390
  %394 = and i32 %385, 2
  %395 = load i8* %row, align 1
  %396 = zext i8 %395 to i32
  %397 = and i32 %396, %393
  %398 = xor i32 %396, %393
  %399 = or i32 %397, %398
  %400 = or i32 %396, %393
  %401 = trunc i32 %399 to i8
  store i8 %401, i8* %row, align 1
  %402 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 1
  %403 = load i8* %402, align 1
  %404 = zext i8 %403 to i32
  %405 = xor i32 -1770876527, -1
  %406 = or i32 %404, -1770876527
  %407 = or i32 16, -1770876527
  %408 = or i32 %404, %405
  %409 = or i32 16, %405
  %410 = and i32 %406, %407
  %411 = and i32 %410, %408
  %412 = and i32 %411, %409
  %413 = and i32 %404, 16
  %414 = ashr i32 %412, 4
  %415 = load i8* %row, align 1
  %416 = zext i8 %415 to i32
  %417 = and i32 %416, %414
  %418 = xor i32 %416, %414
  %419 = or i32 %417, %418
  %420 = or i32 %416, %414
  %421 = trunc i32 %419 to i8
  store i8 %421, i8* %row, align 1
  store i8 0, i8* %column, align 1
  %422 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 0
  %423 = load i8* %422, align 1
  %424 = zext i8 %423 to i32
  %425 = xor i32 1850151836, -1
  %426 = or i32 %424, 1850151836
  %427 = or i32 1, 1850151836
  %428 = or i32 %424, %425
  %429 = or i32 1, %425
  %430 = and i32 %426, %427
  %431 = and i32 %430, %428
  %432 = and i32 %431, %429
  %433 = and i32 %424, 1
  %434 = shl i32 %432, 3
  %435 = load i8* %column, align 1
  %436 = zext i8 %435 to i32
  %437 = and i32 %436, %434
  %438 = xor i32 %436, %434
  %439 = or i32 %437, %438
  %440 = or i32 %436, %434
  %441 = trunc i32 %439 to i8
  store i8 %441, i8* %column, align 1
  %442 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 1
  %443 = load i8* %442, align 1
  %444 = zext i8 %443 to i32
  %445 = xor i32 -1596208093, -1
  %446 = or i32 %444, -1596208093
  %447 = or i32 224, -1596208093
  %448 = or i32 %444, %445
  %449 = or i32 224, %445
  %450 = and i32 %446, %447
  %451 = and i32 %450, %448
  %452 = and i32 %451, %449
  %453 = and i32 %444, 224
  %454 = ashr i32 %452, 5
  %455 = load i8* %column, align 1
  %456 = zext i8 %455 to i32
  %457 = xor i32 %456, -1
  %458 = xor i32 %454, -1
  %459 = xor i32 980307232, -1
  %460 = and i32 %457, 980307232
  %461 = and i32 %456, %459
  %462 = and i32 %458, 980307232
  %463 = and i32 %454, %459
  %464 = or i32 %460, %461
  %465 = or i32 %462, %463
  %466 = xor i32 %464, %465
  %467 = or i32 %457, %458
  %468 = xor i32 %467, -1
  %469 = or i32 980307232, %459
  %470 = and i32 %468, %469
  %471 = or i32 %466, %470
  %472 = or i32 %456, %454
  %473 = trunc i32 %471 to i8
  store i8 %473, i8* %column, align 1
  %474 = load i8* %row, align 1
  %475 = zext i8 %474 to i32
  %476 = mul nsw i32 %475, 16
  %477 = load i8* %column, align 1
  %478 = zext i8 %477 to i32
  %479 = xor i32 %476, %478
  %480 = and i32 %476, %478
  %481 = add i32 %480, %480
  %482 = add nsw i32 %479, %481
  %483 = add nsw i32 %476, %478
  %484 = sext i32 %482 to i64
  %485 = getelementptr inbounds [64 x i32]* @S2, i32 0, i64 %484
  %486 = load i32* %485, align 4
  %487 = trunc i32 %486 to i8
  %488 = zext i8 %487 to i32
  %489 = getelementptr inbounds [4 x i8]* %ser, i32 0, i64 0
  %490 = load i8* %489, align 1
  %491 = zext i8 %490 to i32
  %492 = xor i32 %491, -1
  %493 = xor i32 %488, -1
  %494 = xor i32 -201946209, -1
  %495 = and i32 %492, -201946209
  %496 = and i32 %491, %494
  %497 = and i32 %493, -201946209
  %498 = and i32 %488, %494
  %499 = or i32 %495, %496
  %500 = or i32 %497, %498
  %501 = xor i32 %499, %500
  %502 = or i32 %492, %493
  %503 = xor i32 %502, -1
  %504 = or i32 -201946209, %494
  %505 = and i32 %503, %504
  %506 = or i32 %501, %505
  %507 = or i32 %491, %488
  %508 = trunc i32 %506 to i8
  store i8 %508, i8* %489, align 1
  store i8 0, i8* %row, align 1
  %509 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 1
  %510 = load i8* %509, align 1
  %511 = zext i8 %510 to i32
  %512 = xor i32 1089766257, -1
  %513 = or i32 %511, 1089766257
  %514 = or i32 8, 1089766257
  %515 = or i32 %511, %512
  %516 = or i32 8, %512
  %517 = and i32 %513, %514
  %518 = and i32 %517, %515
  %519 = and i32 %518, %516
  %520 = and i32 %511, 8
  %521 = ashr i32 %519, 2
  %522 = load i8* %row, align 1
  %523 = zext i8 %522 to i32
  %524 = xor i32 %523, -1
  %525 = xor i32 %521, -1
  %526 = xor i32 -358664819, -1
  %527 = and i32 %524, -358664819
  %528 = and i32 %523, %526
  %529 = and i32 %525, -358664819
  %530 = and i32 %521, %526
  %531 = or i32 %527, %528
  %532 = or i32 %529, %530
  %533 = xor i32 %531, %532
  %534 = or i32 %524, %525
  %535 = xor i32 %534, -1
  %536 = or i32 -358664819, %526
  %537 = and i32 %535, %536
  %538 = or i32 %533, %537
  %539 = or i32 %523, %521
  %540 = trunc i32 %538 to i8
  store i8 %540, i8* %row, align 1
  %541 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 2
  %542 = load i8* %541, align 1
  %543 = zext i8 %542 to i32
  %544 = xor i32 -1749245116, -1
  %545 = or i32 %543, -1749245116
  %546 = or i32 64, -1749245116
  %547 = or i32 %543, %544
  %548 = or i32 64, %544
  %549 = and i32 %545, %546
  %550 = and i32 %549, %547
  %551 = and i32 %550, %548
  %552 = and i32 %543, 64
  %553 = ashr i32 %551, 6
  %554 = load i8* %row, align 1
  %555 = zext i8 %554 to i32
  %556 = xor i32 %555, -1
  %557 = xor i32 %553, -1
  %558 = xor i32 192428198, -1
  %559 = and i32 %556, 192428198
  %560 = and i32 %555, %558
  %561 = and i32 %557, 192428198
  %562 = and i32 %553, %558
  %563 = or i32 %559, %560
  %564 = or i32 %561, %562
  %565 = xor i32 %563, %564
  %566 = or i32 %556, %557
  %567 = xor i32 %566, -1
  %568 = or i32 192428198, %558
  %569 = and i32 %567, %568
  %570 = or i32 %565, %569
  %571 = or i32 %555, %553
  %572 = trunc i32 %570 to i8
  store i8 %572, i8* %row, align 1
  store i8 0, i8* %column, align 1
  %573 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 1
  %574 = load i8* %573, align 1
  %575 = zext i8 %574 to i32
  %576 = xor i32 -388792596, -1
  %577 = or i32 %575, -388792596
  %578 = or i32 7, -388792596
  %579 = or i32 %575, %576
  %580 = or i32 7, %576
  %581 = and i32 %577, %578
  %582 = and i32 %581, %579
  %583 = and i32 %582, %580
  %584 = and i32 %575, 7
  %585 = shl i32 %583, 1
  %586 = load i8* %column, align 1
  %587 = zext i8 %586 to i32
  %588 = xor i32 %587, -1
  %589 = xor i32 %585, -1
  %590 = xor i32 -1306946159, -1
  %591 = and i32 %588, -1306946159
  %592 = and i32 %587, %590
  %593 = and i32 %589, -1306946159
  %594 = and i32 %585, %590
  %595 = or i32 %591, %592
  %596 = or i32 %593, %594
  %597 = xor i32 %595, %596
  %598 = or i32 %588, %589
  %599 = xor i32 %598, -1
  %600 = or i32 -1306946159, %590
  %601 = and i32 %599, %600
  %602 = or i32 %597, %601
  %603 = or i32 %587, %585
  %604 = trunc i32 %602 to i8
  store i8 %604, i8* %column, align 1
  %605 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 2
  %606 = load i8* %605, align 1
  %607 = zext i8 %606 to i32
  %608 = xor i32 -1844333135, -1
  %609 = or i32 %607, -1844333135
  %610 = or i32 128, -1844333135
  %611 = or i32 %607, %608
  %612 = or i32 128, %608
  %613 = and i32 %609, %610
  %614 = and i32 %613, %611
  %615 = and i32 %614, %612
  %616 = and i32 %607, 128
  %617 = ashr i32 %615, 7
  %618 = load i8* %column, align 1
  %619 = zext i8 %618 to i32
  %620 = xor i32 %619, -1
  %621 = xor i32 %617, -1
  %622 = xor i32 2104649142, -1
  %623 = and i32 %620, 2104649142
  %624 = and i32 %619, %622
  %625 = and i32 %621, 2104649142
  %626 = and i32 %617, %622
  %627 = or i32 %623, %624
  %628 = or i32 %625, %626
  %629 = xor i32 %627, %628
  %630 = or i32 %620, %621
  %631 = xor i32 %630, -1
  %632 = or i32 2104649142, %622
  %633 = and i32 %631, %632
  %634 = or i32 %629, %633
  %635 = or i32 %619, %617
  %636 = trunc i32 %634 to i8
  store i8 %636, i8* %column, align 1
  %637 = load i8* %row, align 1
  %638 = zext i8 %637 to i32
  %639 = mul nsw i32 %638, 16
  %640 = load i8* %column, align 1
  %641 = zext i8 %640 to i32
  %642 = xor i32 %639, %641
  %643 = and i32 %639, %641
  %644 = add i32 %643, %643
  %645 = add nsw i32 %642, %644
  %646 = add nsw i32 %639, %641
  %647 = sext i32 %645 to i64
  %648 = getelementptr inbounds [64 x i32]* @S3, i32 0, i64 %647
  %649 = load i32* %648, align 4
  %650 = trunc i32 %649 to i8
  %651 = zext i8 %650 to i32
  %652 = shl i32 %651, 4
  %653 = getelementptr inbounds [4 x i8]* %ser, i32 0, i64 1
  %654 = load i8* %653, align 1
  %655 = zext i8 %654 to i32
  %656 = xor i32 %655, -1
  %657 = xor i32 %652, -1
  %658 = xor i32 -1343238180, -1
  %659 = and i32 %656, -1343238180
  %660 = and i32 %655, %658
  %661 = and i32 %657, -1343238180
  %662 = and i32 %652, %658
  %663 = or i32 %659, %660
  %664 = or i32 %661, %662
  %665 = xor i32 %663, %664
  %666 = or i32 %656, %657
  %667 = xor i32 %666, -1
  %668 = or i32 -1343238180, %658
  %669 = and i32 %667, %668
  %670 = or i32 %665, %669
  %671 = or i32 %655, %652
  %672 = trunc i32 %670 to i8
  store i8 %672, i8* %653, align 1
  store i8 0, i8* %row, align 1
  %673 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 2
  %674 = load i8* %673, align 1
  %675 = zext i8 %674 to i32
  %676 = xor i32 -1811305994, -1
  %677 = or i32 %675, -1811305994
  %678 = or i32 32, -1811305994
  %679 = or i32 %675, %676
  %680 = or i32 32, %676
  %681 = and i32 %677, %678
  %682 = and i32 %681, %679
  %683 = and i32 %682, %680
  %684 = and i32 %675, 32
  %685 = ashr i32 %683, 4
  %686 = load i8* %row, align 1
  %687 = zext i8 %686 to i32
  %688 = and i32 %687, %685
  %689 = xor i32 %687, %685
  %690 = or i32 %688, %689
  %691 = or i32 %687, %685
  %692 = trunc i32 %690 to i8
  store i8 %692, i8* %row, align 1
  %693 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 2
  %694 = load i8* %693, align 1
  %695 = zext i8 %694 to i32
  %696 = xor i32 1297193212, -1
  %697 = or i32 %695, 1297193212
  %698 = or i32 1, 1297193212
  %699 = or i32 %695, %696
  %700 = or i32 1, %696
  %701 = and i32 %697, %698
  %702 = and i32 %701, %699
  %703 = and i32 %702, %700
  %704 = and i32 %695, 1
  %705 = load i8* %row, align 1
  %706 = zext i8 %705 to i32
  %707 = xor i32 %706, -1
  %708 = xor i32 %703, -1
  %709 = xor i32 1079800258, -1
  %710 = and i32 %707, 1079800258
  %711 = and i32 %706, %709
  %712 = and i32 %708, 1079800258
  %713 = and i32 %703, %709
  %714 = or i32 %710, %711
  %715 = or i32 %712, %713
  %716 = xor i32 %714, %715
  %717 = or i32 %707, %708
  %718 = xor i32 %717, -1
  %719 = or i32 1079800258, %709
  %720 = and i32 %718, %719
  %721 = or i32 %716, %720
  %722 = or i32 %706, %703
  %723 = trunc i32 %721 to i8
  store i8 %723, i8* %row, align 1
  store i8 0, i8* %column, align 1
  %724 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 2
  %725 = load i8* %724, align 1
  %726 = zext i8 %725 to i32
  %727 = xor i32 -86123348, -1
  %728 = or i32 %726, -86123348
  %729 = or i32 30, -86123348
  %730 = or i32 %726, %727
  %731 = or i32 30, %727
  %732 = and i32 %728, %729
  %733 = and i32 %732, %730
  %734 = and i32 %733, %731
  %735 = and i32 %726, 30
  %736 = ashr i32 %734, 1
  %737 = load i8* %column, align 1
  %738 = zext i8 %737 to i32
  %739 = xor i32 %738, -1
  %740 = xor i32 %736, -1
  %741 = xor i32 779362070, -1
  %742 = and i32 %739, 779362070
  %743 = and i32 %738, %741
  %744 = and i32 %740, 779362070
  %745 = and i32 %736, %741
  %746 = or i32 %742, %743
  %747 = or i32 %744, %745
  %748 = xor i32 %746, %747
  %749 = or i32 %739, %740
  %750 = xor i32 %749, -1
  %751 = or i32 779362070, %741
  %752 = and i32 %750, %751
  %753 = or i32 %748, %752
  %754 = or i32 %738, %736
  %755 = trunc i32 %753 to i8
  store i8 %755, i8* %column, align 1
  %756 = load i8* %row, align 1
  %757 = zext i8 %756 to i32
  %758 = mul nsw i32 %757, 16
  %759 = load i8* %column, align 1
  %760 = zext i8 %759 to i32
  %761 = xor i32 %758, %760
  %762 = and i32 %758, %760
  %763 = add i32 %762, %762
  %764 = add nsw i32 %761, %763
  %765 = add nsw i32 %758, %760
  %766 = sext i32 %764 to i64
  %767 = getelementptr inbounds [64 x i32]* @S4, i32 0, i64 %766
  %768 = load i32* %767, align 4
  %769 = trunc i32 %768 to i8
  %770 = zext i8 %769 to i32
  %771 = getelementptr inbounds [4 x i8]* %ser, i32 0, i64 1
  %772 = load i8* %771, align 1
  %773 = zext i8 %772 to i32
  %774 = and i32 %773, %770
  %775 = xor i32 %773, %770
  %776 = or i32 %774, %775
  %777 = or i32 %773, %770
  %778 = trunc i32 %776 to i8
  store i8 %778, i8* %771, align 1
  store i8 0, i8* %row, align 1
  %779 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 3
  %780 = load i8* %779, align 1
  %781 = zext i8 %780 to i32
  %782 = xor i32 -2090422885, -1
  %783 = or i32 %781, -2090422885
  %784 = or i32 128, -2090422885
  %785 = or i32 %781, %782
  %786 = or i32 128, %782
  %787 = and i32 %783, %784
  %788 = and i32 %787, %785
  %789 = and i32 %788, %786
  %790 = and i32 %781, 128
  %791 = ashr i32 %789, 6
  %792 = load i8* %row, align 1
  %793 = zext i8 %792 to i32
  %794 = xor i32 %793, -1
  %795 = xor i32 %791, -1
  %796 = xor i32 54546042, -1
  %797 = and i32 %794, 54546042
  %798 = and i32 %793, %796
  %799 = and i32 %795, 54546042
  %800 = and i32 %791, %796
  %801 = or i32 %797, %798
  %802 = or i32 %799, %800
  %803 = xor i32 %801, %802
  %804 = or i32 %794, %795
  %805 = xor i32 %804, -1
  %806 = or i32 54546042, %796
  %807 = and i32 %805, %806
  %808 = or i32 %803, %807
  %809 = or i32 %793, %791
  %810 = trunc i32 %808 to i8
  store i8 %810, i8* %row, align 1
  %811 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 3
  %812 = load i8* %811, align 1
  %813 = zext i8 %812 to i32
  %814 = xor i32 174858087, -1
  %815 = or i32 %813, 174858087
  %816 = or i32 4, 174858087
  %817 = or i32 %813, %814
  %818 = or i32 4, %814
  %819 = and i32 %815, %816
  %820 = and i32 %819, %817
  %821 = and i32 %820, %818
  %822 = and i32 %813, 4
  %823 = ashr i32 %821, 2
  %824 = load i8* %row, align 1
  %825 = zext i8 %824 to i32
  %826 = and i32 %825, %823
  %827 = xor i32 %825, %823
  %828 = or i32 %826, %827
  %829 = or i32 %825, %823
  %830 = trunc i32 %828 to i8
  store i8 %830, i8* %row, align 1
  store i8 0, i8* %column, align 1
  %831 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 3
  %832 = load i8* %831, align 1
  %833 = zext i8 %832 to i32
  %834 = xor i32 1964907034, -1
  %835 = or i32 %833, 1964907034
  %836 = or i32 120, 1964907034
  %837 = or i32 %833, %834
  %838 = or i32 120, %834
  %839 = and i32 %835, %836
  %840 = and i32 %839, %837
  %841 = and i32 %840, %838
  %842 = and i32 %833, 120
  %843 = ashr i32 %841, 3
  %844 = load i8* %column, align 1
  %845 = zext i8 %844 to i32
  %846 = xor i32 %845, -1
  %847 = xor i32 %843, -1
  %848 = xor i32 1221817205, -1
  %849 = and i32 %846, 1221817205
  %850 = and i32 %845, %848
  %851 = and i32 %847, 1221817205
  %852 = and i32 %843, %848
  %853 = or i32 %849, %850
  %854 = or i32 %851, %852
  %855 = xor i32 %853, %854
  %856 = or i32 %846, %847
  %857 = xor i32 %856, -1
  %858 = or i32 1221817205, %848
  %859 = and i32 %857, %858
  %860 = or i32 %855, %859
  %861 = or i32 %845, %843
  %862 = trunc i32 %860 to i8
  store i8 %862, i8* %column, align 1
  %863 = load i8* %row, align 1
  %864 = zext i8 %863 to i32
  %865 = mul nsw i32 %864, 16
  %866 = load i8* %column, align 1
  %867 = zext i8 %866 to i32
  %868 = xor i32 %865, %867
  %869 = and i32 %865, %867
  %870 = add i32 %869, %869
  %871 = add nsw i32 %868, %870
  %872 = add nsw i32 %865, %867
  %873 = sext i32 %871 to i64
  %874 = getelementptr inbounds [64 x i32]* @S5, i32 0, i64 %873
  %875 = load i32* %874, align 4
  %876 = trunc i32 %875 to i8
  %877 = zext i8 %876 to i32
  %878 = shl i32 %877, 4
  %879 = getelementptr inbounds [4 x i8]* %ser, i32 0, i64 2
  %880 = load i8* %879, align 1
  %881 = zext i8 %880 to i32
  %882 = xor i32 %881, -1
  %883 = xor i32 %878, -1
  %884 = xor i32 -1184158044, -1
  %885 = and i32 %882, -1184158044
  %886 = and i32 %881, %884
  %887 = and i32 %883, -1184158044
  %888 = and i32 %878, %884
  %889 = or i32 %885, %886
  %890 = or i32 %887, %888
  %891 = xor i32 %889, %890
  %892 = or i32 %882, %883
  %893 = xor i32 %892, -1
  %894 = or i32 -1184158044, %884
  %895 = and i32 %893, %894
  %896 = or i32 %891, %895
  %897 = or i32 %881, %878
  %898 = trunc i32 %896 to i8
  store i8 %898, i8* %879, align 1
  store i8 0, i8* %row, align 1
  %899 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 3
  %900 = load i8* %899, align 1
  %901 = zext i8 %900 to i32
  %902 = xor i32 -1522339391, -1
  %903 = or i32 %901, -1522339391
  %904 = or i32 2, -1522339391
  %905 = or i32 %901, %902
  %906 = or i32 2, %902
  %907 = and i32 %903, %904
  %908 = and i32 %907, %905
  %909 = and i32 %908, %906
  %910 = and i32 %901, 2
  %911 = load i8* %row, align 1
  %912 = zext i8 %911 to i32
  %913 = and i32 %912, %909
  %914 = xor i32 %912, %909
  %915 = or i32 %913, %914
  %916 = or i32 %912, %909
  %917 = trunc i32 %915 to i8
  store i8 %917, i8* %row, align 1
  %918 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 4
  %919 = load i8* %918, align 1
  %920 = zext i8 %919 to i32
  %921 = xor i32 -1886468811, -1
  %922 = or i32 %920, -1886468811
  %923 = or i32 16, -1886468811
  %924 = or i32 %920, %921
  %925 = or i32 16, %921
  %926 = and i32 %922, %923
  %927 = and i32 %926, %924
  %928 = and i32 %927, %925
  %929 = and i32 %920, 16
  %930 = ashr i32 %928, 4
  %931 = load i8* %row, align 1
  %932 = zext i8 %931 to i32
  %933 = and i32 %932, %930
  %934 = xor i32 %932, %930
  %935 = or i32 %933, %934
  %936 = or i32 %932, %930
  %937 = trunc i32 %935 to i8
  store i8 %937, i8* %row, align 1
  store i8 0, i8* %column, align 1
  %938 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 3
  %939 = load i8* %938, align 1
  %940 = zext i8 %939 to i32
  %941 = xor i32 -1462325767, -1
  %942 = or i32 %940, -1462325767
  %943 = or i32 1, -1462325767
  %944 = or i32 %940, %941
  %945 = or i32 1, %941
  %946 = and i32 %942, %943
  %947 = and i32 %946, %944
  %948 = and i32 %947, %945
  %949 = and i32 %940, 1
  %950 = shl i32 %948, 3
  %951 = load i8* %column, align 1
  %952 = zext i8 %951 to i32
  %953 = and i32 %952, %950
  %954 = xor i32 %952, %950
  %955 = or i32 %953, %954
  %956 = or i32 %952, %950
  %957 = trunc i32 %955 to i8
  store i8 %957, i8* %column, align 1
  %958 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 4
  %959 = load i8* %958, align 1
  %960 = zext i8 %959 to i32
  %961 = xor i32 -917652319, -1
  %962 = or i32 %960, -917652319
  %963 = or i32 224, -917652319
  %964 = or i32 %960, %961
  %965 = or i32 224, %961
  %966 = and i32 %962, %963
  %967 = and i32 %966, %964
  %968 = and i32 %967, %965
  %969 = and i32 %960, 224
  %970 = ashr i32 %968, 5
  %971 = load i8* %column, align 1
  %972 = zext i8 %971 to i32
  %973 = xor i32 %972, -1
  %974 = xor i32 %970, -1
  %975 = xor i32 -980148057, -1
  %976 = and i32 %973, -980148057
  %977 = and i32 %972, %975
  %978 = and i32 %974, -980148057
  %979 = and i32 %970, %975
  %980 = or i32 %976, %977
  %981 = or i32 %978, %979
  %982 = xor i32 %980, %981
  %983 = or i32 %973, %974
  %984 = xor i32 %983, -1
  %985 = or i32 -980148057, %975
  %986 = and i32 %984, %985
  %987 = or i32 %982, %986
  %988 = or i32 %972, %970
  %989 = trunc i32 %987 to i8
  store i8 %989, i8* %column, align 1
  %990 = load i8* %row, align 1
  %991 = zext i8 %990 to i32
  %992 = mul nsw i32 %991, 16
  %993 = load i8* %column, align 1
  %994 = zext i8 %993 to i32
  %995 = xor i32 %992, %994
  %996 = and i32 %992, %994
  %997 = add i32 %996, %996
  %998 = add nsw i32 %995, %997
  %999 = add nsw i32 %992, %994
  %1000 = sext i32 %998 to i64
  %1001 = getelementptr inbounds [64 x i32]* @S6, i32 0, i64 %1000
  %1002 = load i32* %1001, align 4
  %1003 = trunc i32 %1002 to i8
  %1004 = zext i8 %1003 to i32
  %1005 = getelementptr inbounds [4 x i8]* %ser, i32 0, i64 2
  %1006 = load i8* %1005, align 1
  %1007 = zext i8 %1006 to i32
  %1008 = and i32 %1007, %1004
  %1009 = xor i32 %1007, %1004
  %1010 = or i32 %1008, %1009
  %1011 = or i32 %1007, %1004
  %1012 = trunc i32 %1010 to i8
  store i8 %1012, i8* %1005, align 1
  store i8 0, i8* %row, align 1
  %1013 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 4
  %1014 = load i8* %1013, align 1
  %1015 = zext i8 %1014 to i32
  %1016 = xor i32 -165273241, -1
  %1017 = or i32 %1015, -165273241
  %1018 = or i32 8, -165273241
  %1019 = or i32 %1015, %1016
  %1020 = or i32 8, %1016
  %1021 = and i32 %1017, %1018
  %1022 = and i32 %1021, %1019
  %1023 = and i32 %1022, %1020
  %1024 = and i32 %1015, 8
  %1025 = ashr i32 %1023, 2
  %1026 = load i8* %row, align 1
  %1027 = zext i8 %1026 to i32
  %1028 = xor i32 %1027, -1
  %1029 = xor i32 %1025, -1
  %1030 = xor i32 683884269, -1
  %1031 = and i32 %1028, 683884269
  %1032 = and i32 %1027, %1030
  %1033 = and i32 %1029, 683884269
  %1034 = and i32 %1025, %1030
  %1035 = or i32 %1031, %1032
  %1036 = or i32 %1033, %1034
  %1037 = xor i32 %1035, %1036
  %1038 = or i32 %1028, %1029
  %1039 = xor i32 %1038, -1
  %1040 = or i32 683884269, %1030
  %1041 = and i32 %1039, %1040
  %1042 = or i32 %1037, %1041
  %1043 = or i32 %1027, %1025
  %1044 = trunc i32 %1042 to i8
  store i8 %1044, i8* %row, align 1
  %1045 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 5
  %1046 = load i8* %1045, align 1
  %1047 = zext i8 %1046 to i32
  %1048 = xor i32 -392912441, -1
  %1049 = or i32 %1047, -392912441
  %1050 = or i32 64, -392912441
  %1051 = or i32 %1047, %1048
  %1052 = or i32 64, %1048
  %1053 = and i32 %1049, %1050
  %1054 = and i32 %1053, %1051
  %1055 = and i32 %1054, %1052
  %1056 = and i32 %1047, 64
  %1057 = ashr i32 %1055, 6
  %1058 = load i8* %row, align 1
  %1059 = zext i8 %1058 to i32
  %1060 = and i32 %1059, %1057
  %1061 = xor i32 %1059, %1057
  %1062 = or i32 %1060, %1061
  %1063 = or i32 %1059, %1057
  %1064 = trunc i32 %1062 to i8
  store i8 %1064, i8* %row, align 1
  store i8 0, i8* %column, align 1
  %1065 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 4
  %1066 = load i8* %1065, align 1
  %1067 = zext i8 %1066 to i32
  %1068 = xor i32 -1559819412, -1
  %1069 = or i32 %1067, -1559819412
  %1070 = or i32 7, -1559819412
  %1071 = or i32 %1067, %1068
  %1072 = or i32 7, %1068
  %1073 = and i32 %1069, %1070
  %1074 = and i32 %1073, %1071
  %1075 = and i32 %1074, %1072
  %1076 = and i32 %1067, 7
  %1077 = shl i32 %1075, 1
  %1078 = load i8* %column, align 1
  %1079 = zext i8 %1078 to i32
  %1080 = and i32 %1079, %1077
  %1081 = xor i32 %1079, %1077
  %1082 = or i32 %1080, %1081
  %1083 = or i32 %1079, %1077
  %1084 = trunc i32 %1082 to i8
  store i8 %1084, i8* %column, align 1
  %1085 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 5
  %1086 = load i8* %1085, align 1
  %1087 = zext i8 %1086 to i32
  %1088 = xor i32 -2086754662, -1
  %1089 = or i32 %1087, -2086754662
  %1090 = or i32 128, -2086754662
  %1091 = or i32 %1087, %1088
  %1092 = or i32 128, %1088
  %1093 = and i32 %1089, %1090
  %1094 = and i32 %1093, %1091
  %1095 = and i32 %1094, %1092
  %1096 = and i32 %1087, 128
  %1097 = ashr i32 %1095, 7
  %1098 = load i8* %column, align 1
  %1099 = zext i8 %1098 to i32
  %1100 = xor i32 %1099, -1
  %1101 = xor i32 %1097, -1
  %1102 = xor i32 -1989501881, -1
  %1103 = and i32 %1100, -1989501881
  %1104 = and i32 %1099, %1102
  %1105 = and i32 %1101, -1989501881
  %1106 = and i32 %1097, %1102
  %1107 = or i32 %1103, %1104
  %1108 = or i32 %1105, %1106
  %1109 = xor i32 %1107, %1108
  %1110 = or i32 %1100, %1101
  %1111 = xor i32 %1110, -1
  %1112 = or i32 -1989501881, %1102
  %1113 = and i32 %1111, %1112
  %1114 = or i32 %1109, %1113
  %1115 = or i32 %1099, %1097
  %1116 = trunc i32 %1114 to i8
  store i8 %1116, i8* %column, align 1
  %1117 = load i8* %row, align 1
  %1118 = zext i8 %1117 to i32
  %1119 = mul nsw i32 %1118, 16
  %1120 = load i8* %column, align 1
  %1121 = zext i8 %1120 to i32
  %1122 = xor i32 %1119, %1121
  %1123 = and i32 %1119, %1121
  %1124 = add i32 %1123, %1123
  %1125 = add nsw i32 %1122, %1124
  %1126 = add nsw i32 %1119, %1121
  %1127 = sext i32 %1125 to i64
  %1128 = getelementptr inbounds [64 x i32]* @S7, i32 0, i64 %1127
  %1129 = load i32* %1128, align 4
  %1130 = trunc i32 %1129 to i8
  %1131 = zext i8 %1130 to i32
  %1132 = shl i32 %1131, 4
  %1133 = getelementptr inbounds [4 x i8]* %ser, i32 0, i64 3
  %1134 = load i8* %1133, align 1
  %1135 = zext i8 %1134 to i32
  %1136 = xor i32 %1135, -1
  %1137 = xor i32 %1132, -1
  %1138 = xor i32 -1577410142, -1
  %1139 = and i32 %1136, -1577410142
  %1140 = and i32 %1135, %1138
  %1141 = and i32 %1137, -1577410142
  %1142 = and i32 %1132, %1138
  %1143 = or i32 %1139, %1140
  %1144 = or i32 %1141, %1142
  %1145 = xor i32 %1143, %1144
  %1146 = or i32 %1136, %1137
  %1147 = xor i32 %1146, -1
  %1148 = or i32 -1577410142, %1138
  %1149 = and i32 %1147, %1148
  %1150 = or i32 %1145, %1149
  %1151 = or i32 %1135, %1132
  %1152 = trunc i32 %1150 to i8
  store i8 %1152, i8* %1133, align 1
  store i8 0, i8* %row, align 1
  %1153 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 5
  %1154 = load i8* %1153, align 1
  %1155 = zext i8 %1154 to i32
  %1156 = xor i32 1387432091, -1
  %1157 = or i32 %1155, 1387432091
  %1158 = or i32 32, 1387432091
  %1159 = or i32 %1155, %1156
  %1160 = or i32 32, %1156
  %1161 = and i32 %1157, %1158
  %1162 = and i32 %1161, %1159
  %1163 = and i32 %1162, %1160
  %1164 = and i32 %1155, 32
  %1165 = ashr i32 %1163, 4
  %1166 = load i8* %row, align 1
  %1167 = zext i8 %1166 to i32
  %1168 = xor i32 %1167, -1
  %1169 = xor i32 %1165, -1
  %1170 = xor i32 -314164167, -1
  %1171 = and i32 %1168, -314164167
  %1172 = and i32 %1167, %1170
  %1173 = and i32 %1169, -314164167
  %1174 = and i32 %1165, %1170
  %1175 = or i32 %1171, %1172
  %1176 = or i32 %1173, %1174
  %1177 = xor i32 %1175, %1176
  %1178 = or i32 %1168, %1169
  %1179 = xor i32 %1178, -1
  %1180 = or i32 -314164167, %1170
  %1181 = and i32 %1179, %1180
  %1182 = or i32 %1177, %1181
  %1183 = or i32 %1167, %1165
  %1184 = trunc i32 %1182 to i8
  store i8 %1184, i8* %row, align 1
  %1185 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 5
  %1186 = load i8* %1185, align 1
  %1187 = zext i8 %1186 to i32
  %1188 = xor i32 -170344409, -1
  %1189 = or i32 %1187, -170344409
  %1190 = or i32 1, -170344409
  %1191 = or i32 %1187, %1188
  %1192 = or i32 1, %1188
  %1193 = and i32 %1189, %1190
  %1194 = and i32 %1193, %1191
  %1195 = and i32 %1194, %1192
  %1196 = and i32 %1187, 1
  %1197 = load i8* %row, align 1
  %1198 = zext i8 %1197 to i32
  %1199 = and i32 %1198, %1195
  %1200 = xor i32 %1198, %1195
  %1201 = or i32 %1199, %1200
  %1202 = or i32 %1198, %1195
  %1203 = trunc i32 %1201 to i8
  store i8 %1203, i8* %row, align 1
  store i8 0, i8* %column, align 1
  %1204 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 5
  %1205 = load i8* %1204, align 1
  %1206 = zext i8 %1205 to i32
  %1207 = xor i32 535465346, -1
  %1208 = or i32 %1206, 535465346
  %1209 = or i32 30, 535465346
  %1210 = or i32 %1206, %1207
  %1211 = or i32 30, %1207
  %1212 = and i32 %1208, %1209
  %1213 = and i32 %1212, %1210
  %1214 = and i32 %1213, %1211
  %1215 = and i32 %1206, 30
  %1216 = ashr i32 %1214, 1
  %1217 = load i8* %column, align 1
  %1218 = zext i8 %1217 to i32
  %1219 = xor i32 %1218, -1
  %1220 = xor i32 %1216, -1
  %1221 = xor i32 -1843912560, -1
  %1222 = and i32 %1219, -1843912560
  %1223 = and i32 %1218, %1221
  %1224 = and i32 %1220, -1843912560
  %1225 = and i32 %1216, %1221
  %1226 = or i32 %1222, %1223
  %1227 = or i32 %1224, %1225
  %1228 = xor i32 %1226, %1227
  %1229 = or i32 %1219, %1220
  %1230 = xor i32 %1229, -1
  %1231 = or i32 -1843912560, %1221
  %1232 = and i32 %1230, %1231
  %1233 = or i32 %1228, %1232
  %1234 = or i32 %1218, %1216
  %1235 = trunc i32 %1233 to i8
  store i8 %1235, i8* %column, align 1
  %1236 = load i8* %row, align 1
  %1237 = zext i8 %1236 to i32
  %1238 = mul nsw i32 %1237, 16
  %1239 = load i8* %column, align 1
  %1240 = zext i8 %1239 to i32
  %1241 = xor i32 %1238, %1240
  %1242 = and i32 %1238, %1240
  %1243 = add i32 %1242, %1242
  %1244 = add nsw i32 %1241, %1243
  %1245 = add nsw i32 %1238, %1240
  %1246 = sext i32 %1244 to i64
  %1247 = getelementptr inbounds [64 x i32]* @S8, i32 0, i64 %1246
  %1248 = load i32* %1247, align 4
  %1249 = trunc i32 %1248 to i8
  %1250 = zext i8 %1249 to i32
  %1251 = getelementptr inbounds [4 x i8]* %ser, i32 0, i64 3
  %1252 = load i8* %1251, align 1
  %1253 = zext i8 %1252 to i32
  %1254 = and i32 %1253, %1250
  %1255 = xor i32 %1253, %1250
  %1256 = or i32 %1254, %1255
  %1257 = or i32 %1253, %1250
  %1258 = trunc i32 %1256 to i8
  store i8 %1258, i8* %1251, align 1
  store i32 0, i32* %i, align 4
  br label %1259

; <label>:1259                                    ; preds = %1266, %274
  %1260 = load i32* %i, align 4
  %1261 = icmp slt i32 %1260, 4
  br i1 %1261, label %1262, label %1273

; <label>:1262                                    ; preds = %1259
  %1263 = load i32* %i, align 4
  %1264 = sext i32 %1263 to i64
  %1265 = getelementptr inbounds [4 x i8]* %rn, i32 0, i64 %1264
  store i8 0, i8* %1265, align 1
  br label %1266

; <label>:1266                                    ; preds = %1262
  %1267 = load i32* %i, align 4
  %1268 = xor i32 %1267, 1
  %1269 = and i32 %1267, 1
  %1270 = add i32 %1269, %1269
  %1271 = add nsw i32 %1268, %1270
  %1272 = add nsw i32 %1267, 1
  store i32 %1271, i32* %i, align 4
  br label %1259

; <label>:1273                                    ; preds = %1259
  store i32 0, i32* %i, align 4
  br label %1274

; <label>:1274                                    ; preds = %1344, %1273
  %1275 = load i32* %i, align 4
  %1276 = icmp slt i32 %1275, 32
  br i1 %1276, label %1277, label %1351

; <label>:1277                                    ; preds = %1274
  %1278 = load i32* %i, align 4
  %1279 = sext i32 %1278 to i64
  %1280 = getelementptr inbounds [32 x i32]* @right_sub_message_permutation, i32 0, i64 %1279
  %1281 = load i32* %1280, align 4
  store i32 %1281, i32* %shift_size, align 4
  %1282 = load i32* %shift_size, align 4
  %1283 = sub i32 0, 1
  %1284 = xor i32 %1282, %1283
  %1285 = and i32 %1282, %1283
  %1286 = add i32 %1285, %1285
  %1287 = add nsw i32 %1284, %1286
  %1288 = sub nsw i32 %1282, 1
  %1289 = srem i32 %1287, 8
  %1290 = ashr i32 128, %1289
  %1291 = trunc i32 %1290 to i8
  store i8 %1291, i8* %shift_byte, align 1
  %1292 = load i32* %shift_size, align 4
  %1293 = sub i32 0, 1
  %1294 = xor i32 %1292, %1293
  %1295 = and i32 %1292, %1293
  %1296 = add i32 %1295, %1295
  %1297 = add nsw i32 %1294, %1296
  %1298 = sub nsw i32 %1292, 1
  %1299 = sdiv i32 %1297, 8
  %1300 = sext i32 %1299 to i64
  %1301 = getelementptr inbounds [4 x i8]* %ser, i32 0, i64 %1300
  %1302 = load i8* %1301, align 1
  %1303 = zext i8 %1302 to i32
  %1304 = load i8* %shift_byte, align 1
  %1305 = zext i8 %1304 to i32
  %1306 = xor i32 -1644495220, -1
  %1307 = or i32 %1305, -1644495220
  %1308 = or i32 %1303, -1644495220
  %1309 = or i32 %1305, %1306
  %1310 = or i32 %1303, %1306
  %1311 = and i32 %1307, %1308
  %1312 = and i32 %1311, %1309
  %1313 = and i32 %1312, %1310
  %1314 = and i32 %1305, %1303
  %1315 = trunc i32 %1313 to i8
  store i8 %1315, i8* %shift_byte, align 1
  %1316 = load i32* %shift_size, align 4
  %1317 = sub i32 0, 1
  %1318 = xor i32 %1316, %1317
  %1319 = and i32 %1316, %1317
  %1320 = add i32 %1319, %1319
  %1321 = add nsw i32 %1318, %1320
  %1322 = sub nsw i32 %1316, 1
  %1323 = srem i32 %1321, 8
  %1324 = load i8* %shift_byte, align 1
  %1325 = zext i8 %1324 to i32
  %1326 = shl i32 %1325, %1323
  %1327 = trunc i32 %1326 to i8
  store i8 %1327, i8* %shift_byte, align 1
  %1328 = load i8* %shift_byte, align 1
  %1329 = zext i8 %1328 to i32
  %1330 = load i32* %i, align 4
  %1331 = srem i32 %1330, 8
  %1332 = ashr i32 %1329, %1331
  %1333 = load i32* %i, align 4
  %1334 = sdiv i32 %1333, 8
  %1335 = sext i32 %1334 to i64
  %1336 = getelementptr inbounds [4 x i8]* %rn, i32 0, i64 %1335
  %1337 = load i8* %1336, align 1
  %1338 = zext i8 %1337 to i32
  %1339 = and i32 %1338, %1332
  %1340 = xor i32 %1338, %1332
  %1341 = or i32 %1339, %1340
  %1342 = or i32 %1338, %1332
  %1343 = trunc i32 %1341 to i8
  store i8 %1343, i8* %1336, align 1
  br label %1344

; <label>:1344                                    ; preds = %1277
  %1345 = load i32* %i, align 4
  %1346 = xor i32 %1345, 1
  %1347 = and i32 %1345, 1
  %1348 = add i32 %1347, %1347
  %1349 = add nsw i32 %1346, %1348
  %1350 = add nsw i32 %1345, 1
  store i32 %1349, i32* %i, align 4
  br label %1274

; <label>:1351                                    ; preds = %1274
  store i32 0, i32* %i, align 4
  br label %1352

; <label>:1352                                    ; preds = %1372, %1351
  %1353 = load i32* %i, align 4
  %1354 = icmp slt i32 %1353, 4
  br i1 %1354, label %1355, label %1379

; <label>:1355                                    ; preds = %1352
  %1356 = load i32* %i, align 4
  %1357 = sext i32 %1356 to i64
  %1358 = getelementptr inbounds [4 x i8]* %l, i32 0, i64 %1357
  %1359 = load i8* %1358, align 1
  %1360 = zext i8 %1359 to i32
  %1361 = load i32* %i, align 4
  %1362 = sext i32 %1361 to i64
  %1363 = getelementptr inbounds [4 x i8]* %rn, i32 0, i64 %1362
  %1364 = load i8* %1363, align 1
  %1365 = zext i8 %1364 to i32
  %1366 = and i32 %1365, %1360
  %1367 = add i32 %1366, %1366
  %1368 = add i32 %1365, %1360
  %1369 = sub i32 %1368, %1367
  %1370 = xor i32 %1365, %1360
  %1371 = trunc i32 %1369 to i8
  store i8 %1371, i8* %1363, align 1
  br label %1372

; <label>:1372                                    ; preds = %1355
  %1373 = load i32* %i, align 4
  %1374 = xor i32 %1373, 1
  %1375 = and i32 %1373, 1
  %1376 = add i32 %1375, %1375
  %1377 = add nsw i32 %1374, %1376
  %1378 = add nsw i32 %1373, 1
  store i32 %1377, i32* %i, align 4
  br label %1352

; <label>:1379                                    ; preds = %1352
  store i32 0, i32* %i, align 4
  br label %1380

; <label>:1380                                    ; preds = %1398, %1379
  %1381 = load i32* %i, align 4
  %1382 = icmp slt i32 %1381, 4
  br i1 %1382, label %1383, label %1405

; <label>:1383                                    ; preds = %1380
  %1384 = load i32* %i, align 4
  %1385 = sext i32 %1384 to i64
  %1386 = getelementptr inbounds [4 x i8]* %ln, i32 0, i64 %1385
  %1387 = load i8* %1386, align 1
  %1388 = load i32* %i, align 4
  %1389 = sext i32 %1388 to i64
  %1390 = getelementptr inbounds [4 x i8]* %l, i32 0, i64 %1389
  store i8 %1387, i8* %1390, align 1
  %1391 = load i32* %i, align 4
  %1392 = sext i32 %1391 to i64
  %1393 = getelementptr inbounds [4 x i8]* %rn, i32 0, i64 %1392
  %1394 = load i8* %1393, align 1
  %1395 = load i32* %i, align 4
  %1396 = sext i32 %1395 to i64
  %1397 = getelementptr inbounds [4 x i8]* %r, i32 0, i64 %1396
  store i8 %1394, i8* %1397, align 1
  br label %1398

; <label>:1398                                    ; preds = %1383
  %1399 = load i32* %i, align 4
  %1400 = xor i32 %1399, 1
  %1401 = and i32 %1399, 1
  %1402 = add i32 %1401, %1401
  %1403 = add nsw i32 %1400, %1402
  %1404 = add nsw i32 %1399, 1
  store i32 %1403, i32* %i, align 4
  br label %1380

; <label>:1405                                    ; preds = %1380
  br label %1406

; <label>:1406                                    ; preds = %1405
  %1407 = load i32* %k, align 4
  %1408 = xor i32 %1407, 1
  %1409 = and i32 %1407, 1
  %1410 = add i32 %1409, %1409
  %1411 = add nsw i32 %1408, %1410
  %1412 = add nsw i32 %1407, 1
  store i32 %1411, i32* %k, align 4
  br label %117

; <label>:1413                                    ; preds = %117
  store i32 0, i32* %i, align 4
  br label %1414

; <label>:1414                                    ; preds = %1437, %1413
  %1415 = load i32* %i, align 4
  %1416 = icmp slt i32 %1415, 4
  br i1 %1416, label %1417, label %1444

; <label>:1417                                    ; preds = %1414
  %1418 = load i32* %i, align 4
  %1419 = sext i32 %1418 to i64
  %1420 = getelementptr inbounds [4 x i8]* %r, i32 0, i64 %1419
  %1421 = load i8* %1420, align 1
  %1422 = load i32* %i, align 4
  %1423 = sext i32 %1422 to i64
  %1424 = getelementptr inbounds [8 x i8]* %pre_end_permutation, i32 0, i64 %1423
  store i8 %1421, i8* %1424, align 1
  %1425 = load i32* %i, align 4
  %1426 = sext i32 %1425 to i64
  %1427 = getelementptr inbounds [4 x i8]* %l, i32 0, i64 %1426
  %1428 = load i8* %1427, align 1
  %1429 = load i32* %i, align 4
  %1430 = xor i32 4, %1429
  %1431 = and i32 4, %1429
  %1432 = add i32 %1431, %1431
  %1433 = add nsw i32 %1430, %1432
  %1434 = add nsw i32 4, %1429
  %1435 = sext i32 %1433 to i64
  %1436 = getelementptr inbounds [8 x i8]* %pre_end_permutation, i32 0, i64 %1435
  store i8 %1428, i8* %1436, align 1
  br label %1437

; <label>:1437                                    ; preds = %1417
  %1438 = load i32* %i, align 4
  %1439 = xor i32 %1438, 1
  %1440 = and i32 %1438, 1
  %1441 = add i32 %1440, %1440
  %1442 = add nsw i32 %1439, %1441
  %1443 = add nsw i32 %1438, 1
  store i32 %1442, i32* %i, align 4
  br label %1414

; <label>:1444                                    ; preds = %1414
  store i32 0, i32* %i, align 4
  br label %1445

; <label>:1445                                    ; preds = %1528, %1444
  %1446 = load i32* %i, align 4
  %1447 = icmp slt i32 %1446, 64
  br i1 %1447, label %1448, label %1535

; <label>:1448                                    ; preds = %1445
  %1449 = load i32* %i, align 4
  %1450 = sext i32 %1449 to i64
  %1451 = getelementptr inbounds [64 x i32]* @final_message_permutation, i32 0, i64 %1450
  %1452 = load i32* %1451, align 4
  store i32 %1452, i32* %shift_size, align 4
  %1453 = load i32* %shift_size, align 4
  %1454 = sub i32 0, 1
  %1455 = xor i32 %1453, %1454
  %1456 = and i32 %1453, %1454
  %1457 = add i32 %1456, %1456
  %1458 = add nsw i32 %1455, %1457
  %1459 = sub nsw i32 %1453, 1
  %1460 = srem i32 %1458, 8
  %1461 = ashr i32 128, %1460
  %1462 = trunc i32 %1461 to i8
  store i8 %1462, i8* %shift_byte, align 1
  %1463 = load i32* %shift_size, align 4
  %1464 = sub i32 0, 1
  %1465 = xor i32 %1463, %1464
  %1466 = and i32 %1463, %1464
  %1467 = add i32 %1466, %1466
  %1468 = add nsw i32 %1465, %1467
  %1469 = sub nsw i32 %1463, 1
  %1470 = sdiv i32 %1468, 8
  %1471 = sext i32 %1470 to i64
  %1472 = getelementptr inbounds [8 x i8]* %pre_end_permutation, i32 0, i64 %1471
  %1473 = load i8* %1472, align 1
  %1474 = zext i8 %1473 to i32
  %1475 = load i8* %shift_byte, align 1
  %1476 = zext i8 %1475 to i32
  %1477 = xor i32 1842945263, -1
  %1478 = or i32 %1476, 1842945263
  %1479 = or i32 %1474, 1842945263
  %1480 = or i32 %1476, %1477
  %1481 = or i32 %1474, %1477
  %1482 = and i32 %1478, %1479
  %1483 = and i32 %1482, %1480
  %1484 = and i32 %1483, %1481
  %1485 = and i32 %1476, %1474
  %1486 = trunc i32 %1484 to i8
  store i8 %1486, i8* %shift_byte, align 1
  %1487 = load i32* %shift_size, align 4
  %1488 = sub i32 0, 1
  %1489 = xor i32 %1487, %1488
  %1490 = and i32 %1487, %1488
  %1491 = add i32 %1490, %1490
  %1492 = add nsw i32 %1489, %1491
  %1493 = sub nsw i32 %1487, 1
  %1494 = srem i32 %1492, 8
  %1495 = load i8* %shift_byte, align 1
  %1496 = zext i8 %1495 to i32
  %1497 = shl i32 %1496, %1494
  %1498 = trunc i32 %1497 to i8
  store i8 %1498, i8* %shift_byte, align 1
  %1499 = load i8* %shift_byte, align 1
  %1500 = zext i8 %1499 to i32
  %1501 = load i32* %i, align 4
  %1502 = srem i32 %1501, 8
  %1503 = ashr i32 %1500, %1502
  %1504 = load i32* %i, align 4
  %1505 = sdiv i32 %1504, 8
  %1506 = sext i32 %1505 to i64
  %1507 = load i8** %2, align 8
  %1508 = getelementptr inbounds i8* %1507, i64 %1506
  %1509 = load i8* %1508, align 1
  %1510 = zext i8 %1509 to i32
  %1511 = xor i32 %1510, -1
  %1512 = xor i32 %1503, -1
  %1513 = xor i32 -925768076, -1
  %1514 = and i32 %1511, -925768076
  %1515 = and i32 %1510, %1513
  %1516 = and i32 %1512, -925768076
  %1517 = and i32 %1503, %1513
  %1518 = or i32 %1514, %1515
  %1519 = or i32 %1516, %1517
  %1520 = xor i32 %1518, %1519
  %1521 = or i32 %1511, %1512
  %1522 = xor i32 %1521, -1
  %1523 = or i32 -925768076, %1513
  %1524 = and i32 %1522, %1523
  %1525 = or i32 %1520, %1524
  %1526 = or i32 %1510, %1503
  %1527 = trunc i32 %1525 to i8
  store i8 %1527, i8* %1508, align 1
  br label %1528

; <label>:1528                                    ; preds = %1448
  %1529 = load i32* %i, align 4
  %1530 = xor i32 %1529, 1
  %1531 = and i32 %1529, 1
  %1532 = add i32 %1531, %1531
  %1533 = add nsw i32 %1530, %1532
  %1534 = add nsw i32 %1529, 1
  store i32 %1533, i32* %i, align 4
  br label %1445

; <label>:1535                                    ; preds = %1445
  ret void
}

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #3

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #3

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"Obfuscator-LLVM clang version 3.6.1 (tags/RELEASE_361/final) (based on Obfuscator-LLVM 3.6.1)"}
