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

; <label>:2                                       ; preds = %21, %0
  %3 = load i32* %i, align 4
  %4 = icmp slt i32 %3, 8
  br i1 %4, label %5, label %24

; <label>:5                                       ; preds = %2
  %6 = load i32* %i, align 4
  %7 = sub nsw i32 7, %6
  %8 = shl i32 1, %7
  %9 = trunc i32 %8 to i8
  store i8 %9, i8* %shift_byte, align 1
  %10 = load i8* %shift_byte, align 1
  %11 = sext i8 %10 to i32
  %12 = load i8* %1, align 1
  %13 = sext i8 %12 to i32
  %14 = and i32 %11, %13
  %15 = icmp ne i32 %14, 0
  br i1 %15, label %16, label %18

; <label>:16                                      ; preds = %5
  %17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str, i32 0, i32 0))
  br label %20

; <label>:18                                      ; preds = %5
  %19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str1, i32 0, i32 0))
  br label %20

; <label>:20                                      ; preds = %18, %16
  br label %21

; <label>:21                                      ; preds = %20
  %22 = load i32* %i, align 4
  %23 = add nsw i32 %22, 1
  store i32 %23, i32* %i, align 4
  br label %2

; <label>:24                                      ; preds = %2
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
  br i1 %4, label %5, label %16

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
  %15 = add nsw i32 %14, 1
  store i32 %15, i32* %i, align 4
  br label %2

; <label>:16                                      ; preds = %2
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
  br i1 %7, label %8, label %25

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
  %24 = add nsw i32 %23, 1
  store i32 %24, i32* %i, align 4
  br label %5

; <label>:25                                      ; preds = %5
  %26 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str5, i32 0, i32 0))
  store i32 0, i32* %i, align 4
  br label %27

; <label>:27                                      ; preds = %44, %25
  %28 = load i32* %i, align 4
  %29 = icmp slt i32 %28, 4
  br i1 %29, label %30, label %47

; <label>:30                                      ; preds = %27
  %31 = load i32* %i, align 4
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds %struct.key_set* %key_set, i32 0, i32 1
  %34 = getelementptr inbounds [4 x i8]* %33, i32 0, i64 %32
  %35 = load i8* %34, align 1
  %36 = zext i8 %35 to i32
  %37 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str3, i32 0, i32 0), i32 %36)
  %38 = load i32* %i, align 4
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds %struct.key_set* %key_set, i32 0, i32 1
  %41 = getelementptr inbounds [4 x i8]* %40, i32 0, i64 %39
  %42 = load i8* %41, align 1
  call void @print_char_as_binary(i8 signext %42)
  %43 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str4, i32 0, i32 0))
  br label %44

; <label>:44                                      ; preds = %30
  %45 = load i32* %i, align 4
  %46 = add nsw i32 %45, 1
  store i32 %46, i32* %i, align 4
  br label %27

; <label>:47                                      ; preds = %27
  %48 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str6, i32 0, i32 0))
  store i32 0, i32* %i, align 4
  br label %49

; <label>:49                                      ; preds = %66, %47
  %50 = load i32* %i, align 4
  %51 = icmp slt i32 %50, 4
  br i1 %51, label %52, label %69

; <label>:52                                      ; preds = %49
  %53 = load i32* %i, align 4
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds %struct.key_set* %key_set, i32 0, i32 2
  %56 = getelementptr inbounds [4 x i8]* %55, i32 0, i64 %54
  %57 = load i8* %56, align 1
  %58 = zext i8 %57 to i32
  %59 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str3, i32 0, i32 0), i32 %58)
  %60 = load i32* %i, align 4
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds %struct.key_set* %key_set, i32 0, i32 2
  %63 = getelementptr inbounds [4 x i8]* %62, i32 0, i64 %61
  %64 = load i8* %63, align 1
  call void @print_char_as_binary(i8 signext %64)
  %65 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str4, i32 0, i32 0))
  br label %66

; <label>:66                                      ; preds = %52
  %67 = load i32* %i, align 4
  %68 = add nsw i32 %67, 1
  store i32 %68, i32* %i, align 4
  br label %49

; <label>:69                                      ; preds = %49
  %70 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str4, i32 0, i32 0))
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
  br i1 %5, label %6, label %16

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
  %15 = add nsw i32 %14, 1
  store i32 %15, i32* %i, align 4
  br label %3

; <label>:16                                      ; preds = %3
  store i32 0, i32* %i, align 4
  br label %17

; <label>:17                                      ; preds = %65, %16
  %18 = load i32* %i, align 4
  %19 = icmp slt i32 %18, 56
  br i1 %19, label %20, label %68

; <label>:20                                      ; preds = %17
  %21 = load i32* %i, align 4
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds [56 x i32]* @initial_key_permutaion, i32 0, i64 %22
  %24 = load i32* %23, align 4
  store i32 %24, i32* %shift_size, align 4
  %25 = load i32* %shift_size, align 4
  %26 = sub nsw i32 %25, 1
  %27 = srem i32 %26, 8
  %28 = ashr i32 128, %27
  %29 = trunc i32 %28 to i8
  store i8 %29, i8* %shift_byte, align 1
  %30 = load i32* %shift_size, align 4
  %31 = sub nsw i32 %30, 1
  %32 = sdiv i32 %31, 8
  %33 = sext i32 %32 to i64
  %34 = load i8** %1, align 8
  %35 = getelementptr inbounds i8* %34, i64 %33
  %36 = load i8* %35, align 1
  %37 = zext i8 %36 to i32
  %38 = load i8* %shift_byte, align 1
  %39 = zext i8 %38 to i32
  %40 = and i32 %39, %37
  %41 = trunc i32 %40 to i8
  store i8 %41, i8* %shift_byte, align 1
  %42 = load i32* %shift_size, align 4
  %43 = sub nsw i32 %42, 1
  %44 = srem i32 %43, 8
  %45 = load i8* %shift_byte, align 1
  %46 = zext i8 %45 to i32
  %47 = shl i32 %46, %44
  %48 = trunc i32 %47 to i8
  store i8 %48, i8* %shift_byte, align 1
  %49 = load i8* %shift_byte, align 1
  %50 = zext i8 %49 to i32
  %51 = load i32* %i, align 4
  %52 = srem i32 %51, 8
  %53 = ashr i32 %50, %52
  %54 = load i32* %i, align 4
  %55 = sdiv i32 %54, 8
  %56 = sext i32 %55 to i64
  %57 = load %struct.key_set** %2, align 8
  %58 = getelementptr inbounds %struct.key_set* %57, i64 0
  %59 = getelementptr inbounds %struct.key_set* %58, i32 0, i32 0
  %60 = getelementptr inbounds [8 x i8]* %59, i32 0, i64 %56
  %61 = load i8* %60, align 1
  %62 = zext i8 %61 to i32
  %63 = or i32 %62, %53
  %64 = trunc i32 %63 to i8
  store i8 %64, i8* %60, align 1
  br label %65

; <label>:65                                      ; preds = %20
  %66 = load i32* %i, align 4
  %67 = add nsw i32 %66, 1
  store i32 %67, i32* %i, align 4
  br label %17

; <label>:68                                      ; preds = %17
  store i32 0, i32* %i, align 4
  br label %69

; <label>:69                                      ; preds = %86, %68
  %70 = load i32* %i, align 4
  %71 = icmp slt i32 %70, 3
  br i1 %71, label %72, label %89

; <label>:72                                      ; preds = %69
  %73 = load i32* %i, align 4
  %74 = sext i32 %73 to i64
  %75 = load %struct.key_set** %2, align 8
  %76 = getelementptr inbounds %struct.key_set* %75, i64 0
  %77 = getelementptr inbounds %struct.key_set* %76, i32 0, i32 0
  %78 = getelementptr inbounds [8 x i8]* %77, i32 0, i64 %74
  %79 = load i8* %78, align 1
  %80 = load i32* %i, align 4
  %81 = sext i32 %80 to i64
  %82 = load %struct.key_set** %2, align 8
  %83 = getelementptr inbounds %struct.key_set* %82, i64 0
  %84 = getelementptr inbounds %struct.key_set* %83, i32 0, i32 1
  %85 = getelementptr inbounds [4 x i8]* %84, i32 0, i64 %81
  store i8 %79, i8* %85, align 1
  br label %86

; <label>:86                                      ; preds = %72
  %87 = load i32* %i, align 4
  %88 = add nsw i32 %87, 1
  store i32 %88, i32* %i, align 4
  br label %69

; <label>:89                                      ; preds = %69
  %90 = load %struct.key_set** %2, align 8
  %91 = getelementptr inbounds %struct.key_set* %90, i64 0
  %92 = getelementptr inbounds %struct.key_set* %91, i32 0, i32 0
  %93 = getelementptr inbounds [8 x i8]* %92, i32 0, i64 3
  %94 = load i8* %93, align 1
  %95 = zext i8 %94 to i32
  %96 = and i32 %95, 240
  %97 = trunc i32 %96 to i8
  %98 = load %struct.key_set** %2, align 8
  %99 = getelementptr inbounds %struct.key_set* %98, i64 0
  %100 = getelementptr inbounds %struct.key_set* %99, i32 0, i32 1
  %101 = getelementptr inbounds [4 x i8]* %100, i32 0, i64 3
  store i8 %97, i8* %101, align 1
  store i32 0, i32* %i, align 4
  br label %102

; <label>:102                                     ; preds = %145, %89
  %103 = load i32* %i, align 4
  %104 = icmp slt i32 %103, 3
  br i1 %104, label %105, label %148

; <label>:105                                     ; preds = %102
  %106 = load i32* %i, align 4
  %107 = add nsw i32 %106, 3
  %108 = sext i32 %107 to i64
  %109 = load %struct.key_set** %2, align 8
  %110 = getelementptr inbounds %struct.key_set* %109, i64 0
  %111 = getelementptr inbounds %struct.key_set* %110, i32 0, i32 0
  %112 = getelementptr inbounds [8 x i8]* %111, i32 0, i64 %108
  %113 = load i8* %112, align 1
  %114 = zext i8 %113 to i32
  %115 = and i32 %114, 15
  %116 = shl i32 %115, 4
  %117 = trunc i32 %116 to i8
  %118 = load i32* %i, align 4
  %119 = sext i32 %118 to i64
  %120 = load %struct.key_set** %2, align 8
  %121 = getelementptr inbounds %struct.key_set* %120, i64 0
  %122 = getelementptr inbounds %struct.key_set* %121, i32 0, i32 2
  %123 = getelementptr inbounds [4 x i8]* %122, i32 0, i64 %119
  store i8 %117, i8* %123, align 1
  %124 = load i32* %i, align 4
  %125 = add nsw i32 %124, 4
  %126 = sext i32 %125 to i64
  %127 = load %struct.key_set** %2, align 8
  %128 = getelementptr inbounds %struct.key_set* %127, i64 0
  %129 = getelementptr inbounds %struct.key_set* %128, i32 0, i32 0
  %130 = getelementptr inbounds [8 x i8]* %129, i32 0, i64 %126
  %131 = load i8* %130, align 1
  %132 = zext i8 %131 to i32
  %133 = and i32 %132, 240
  %134 = ashr i32 %133, 4
  %135 = load i32* %i, align 4
  %136 = sext i32 %135 to i64
  %137 = load %struct.key_set** %2, align 8
  %138 = getelementptr inbounds %struct.key_set* %137, i64 0
  %139 = getelementptr inbounds %struct.key_set* %138, i32 0, i32 2
  %140 = getelementptr inbounds [4 x i8]* %139, i32 0, i64 %136
  %141 = load i8* %140, align 1
  %142 = zext i8 %141 to i32
  %143 = or i32 %142, %134
  %144 = trunc i32 %143 to i8
  store i8 %144, i8* %140, align 1
  br label %145

; <label>:145                                     ; preds = %105
  %146 = load i32* %i, align 4
  %147 = add nsw i32 %146, 1
  store i32 %147, i32* %i, align 4
  br label %102

; <label>:148                                     ; preds = %102
  %149 = load %struct.key_set** %2, align 8
  %150 = getelementptr inbounds %struct.key_set* %149, i64 0
  %151 = getelementptr inbounds %struct.key_set* %150, i32 0, i32 0
  %152 = getelementptr inbounds [8 x i8]* %151, i32 0, i64 6
  %153 = load i8* %152, align 1
  %154 = zext i8 %153 to i32
  %155 = and i32 %154, 15
  %156 = shl i32 %155, 4
  %157 = trunc i32 %156 to i8
  %158 = load %struct.key_set** %2, align 8
  %159 = getelementptr inbounds %struct.key_set* %158, i64 0
  %160 = getelementptr inbounds %struct.key_set* %159, i32 0, i32 2
  %161 = getelementptr inbounds [4 x i8]* %160, i32 0, i64 3
  store i8 %157, i8* %161, align 1
  store i32 1, i32* %i, align 4
  br label %162

; <label>:162                                     ; preds = %614, %148
  %163 = load i32* %i, align 4
  %164 = icmp slt i32 %163, 17
  br i1 %164, label %165, label %617

; <label>:165                                     ; preds = %162
  store i32 0, i32* %j, align 4
  br label %166

; <label>:166                                     ; preds = %206, %165
  %167 = load i32* %j, align 4
  %168 = icmp slt i32 %167, 4
  br i1 %168, label %169, label %209

; <label>:169                                     ; preds = %166
  %170 = load i32* %j, align 4
  %171 = sext i32 %170 to i64
  %172 = load i32* %i, align 4
  %173 = sub nsw i32 %172, 1
  %174 = sext i32 %173 to i64
  %175 = load %struct.key_set** %2, align 8
  %176 = getelementptr inbounds %struct.key_set* %175, i64 %174
  %177 = getelementptr inbounds %struct.key_set* %176, i32 0, i32 1
  %178 = getelementptr inbounds [4 x i8]* %177, i32 0, i64 %171
  %179 = load i8* %178, align 1
  %180 = load i32* %j, align 4
  %181 = sext i32 %180 to i64
  %182 = load i32* %i, align 4
  %183 = sext i32 %182 to i64
  %184 = load %struct.key_set** %2, align 8
  %185 = getelementptr inbounds %struct.key_set* %184, i64 %183
  %186 = getelementptr inbounds %struct.key_set* %185, i32 0, i32 1
  %187 = getelementptr inbounds [4 x i8]* %186, i32 0, i64 %181
  store i8 %179, i8* %187, align 1
  %188 = load i32* %j, align 4
  %189 = sext i32 %188 to i64
  %190 = load i32* %i, align 4
  %191 = sub nsw i32 %190, 1
  %192 = sext i32 %191 to i64
  %193 = load %struct.key_set** %2, align 8
  %194 = getelementptr inbounds %struct.key_set* %193, i64 %192
  %195 = getelementptr inbounds %struct.key_set* %194, i32 0, i32 2
  %196 = getelementptr inbounds [4 x i8]* %195, i32 0, i64 %189
  %197 = load i8* %196, align 1
  %198 = load i32* %j, align 4
  %199 = sext i32 %198 to i64
  %200 = load i32* %i, align 4
  %201 = sext i32 %200 to i64
  %202 = load %struct.key_set** %2, align 8
  %203 = getelementptr inbounds %struct.key_set* %202, i64 %201
  %204 = getelementptr inbounds %struct.key_set* %203, i32 0, i32 2
  %205 = getelementptr inbounds [4 x i8]* %204, i32 0, i64 %199
  store i8 %197, i8* %205, align 1
  br label %206

; <label>:206                                     ; preds = %169
  %207 = load i32* %j, align 4
  %208 = add nsw i32 %207, 1
  store i32 %208, i32* %j, align 4
  br label %166

; <label>:209                                     ; preds = %166
  %210 = load i32* %i, align 4
  %211 = sext i32 %210 to i64
  %212 = getelementptr inbounds [17 x i32]* @key_shift_sizes, i32 0, i64 %211
  %213 = load i32* %212, align 4
  store i32 %213, i32* %shift_size, align 4
  %214 = load i32* %shift_size, align 4
  %215 = icmp eq i32 %214, 1
  br i1 %215, label %216, label %217

; <label>:216                                     ; preds = %209
  store i8 -128, i8* %shift_byte, align 1
  br label %218

; <label>:217                                     ; preds = %209
  store i8 -64, i8* %shift_byte, align 1
  br label %218

; <label>:218                                     ; preds = %217, %216
  %219 = load i8* %shift_byte, align 1
  %220 = zext i8 %219 to i32
  %221 = load i32* %i, align 4
  %222 = sext i32 %221 to i64
  %223 = load %struct.key_set** %2, align 8
  %224 = getelementptr inbounds %struct.key_set* %223, i64 %222
  %225 = getelementptr inbounds %struct.key_set* %224, i32 0, i32 1
  %226 = getelementptr inbounds [4 x i8]* %225, i32 0, i64 0
  %227 = load i8* %226, align 1
  %228 = zext i8 %227 to i32
  %229 = and i32 %220, %228
  %230 = trunc i32 %229 to i8
  store i8 %230, i8* %first_shift_bits, align 1
  %231 = load i8* %shift_byte, align 1
  %232 = zext i8 %231 to i32
  %233 = load i32* %i, align 4
  %234 = sext i32 %233 to i64
  %235 = load %struct.key_set** %2, align 8
  %236 = getelementptr inbounds %struct.key_set* %235, i64 %234
  %237 = getelementptr inbounds %struct.key_set* %236, i32 0, i32 1
  %238 = getelementptr inbounds [4 x i8]* %237, i32 0, i64 1
  %239 = load i8* %238, align 1
  %240 = zext i8 %239 to i32
  %241 = and i32 %232, %240
  %242 = trunc i32 %241 to i8
  store i8 %242, i8* %second_shift_bits, align 1
  %243 = load i8* %shift_byte, align 1
  %244 = zext i8 %243 to i32
  %245 = load i32* %i, align 4
  %246 = sext i32 %245 to i64
  %247 = load %struct.key_set** %2, align 8
  %248 = getelementptr inbounds %struct.key_set* %247, i64 %246
  %249 = getelementptr inbounds %struct.key_set* %248, i32 0, i32 1
  %250 = getelementptr inbounds [4 x i8]* %249, i32 0, i64 2
  %251 = load i8* %250, align 1
  %252 = zext i8 %251 to i32
  %253 = and i32 %244, %252
  %254 = trunc i32 %253 to i8
  store i8 %254, i8* %third_shift_bits, align 1
  %255 = load i8* %shift_byte, align 1
  %256 = zext i8 %255 to i32
  %257 = load i32* %i, align 4
  %258 = sext i32 %257 to i64
  %259 = load %struct.key_set** %2, align 8
  %260 = getelementptr inbounds %struct.key_set* %259, i64 %258
  %261 = getelementptr inbounds %struct.key_set* %260, i32 0, i32 1
  %262 = getelementptr inbounds [4 x i8]* %261, i32 0, i64 3
  %263 = load i8* %262, align 1
  %264 = zext i8 %263 to i32
  %265 = and i32 %256, %264
  %266 = trunc i32 %265 to i8
  store i8 %266, i8* %fourth_shift_bits, align 1
  %267 = load i32* %shift_size, align 4
  %268 = load i32* %i, align 4
  %269 = sext i32 %268 to i64
  %270 = load %struct.key_set** %2, align 8
  %271 = getelementptr inbounds %struct.key_set* %270, i64 %269
  %272 = getelementptr inbounds %struct.key_set* %271, i32 0, i32 1
  %273 = getelementptr inbounds [4 x i8]* %272, i32 0, i64 0
  %274 = load i8* %273, align 1
  %275 = zext i8 %274 to i32
  %276 = shl i32 %275, %267
  %277 = trunc i32 %276 to i8
  store i8 %277, i8* %273, align 1
  %278 = load i8* %second_shift_bits, align 1
  %279 = zext i8 %278 to i32
  %280 = load i32* %shift_size, align 4
  %281 = sub nsw i32 8, %280
  %282 = ashr i32 %279, %281
  %283 = load i32* %i, align 4
  %284 = sext i32 %283 to i64
  %285 = load %struct.key_set** %2, align 8
  %286 = getelementptr inbounds %struct.key_set* %285, i64 %284
  %287 = getelementptr inbounds %struct.key_set* %286, i32 0, i32 1
  %288 = getelementptr inbounds [4 x i8]* %287, i32 0, i64 0
  %289 = load i8* %288, align 1
  %290 = zext i8 %289 to i32
  %291 = or i32 %290, %282
  %292 = trunc i32 %291 to i8
  store i8 %292, i8* %288, align 1
  %293 = load i32* %shift_size, align 4
  %294 = load i32* %i, align 4
  %295 = sext i32 %294 to i64
  %296 = load %struct.key_set** %2, align 8
  %297 = getelementptr inbounds %struct.key_set* %296, i64 %295
  %298 = getelementptr inbounds %struct.key_set* %297, i32 0, i32 1
  %299 = getelementptr inbounds [4 x i8]* %298, i32 0, i64 1
  %300 = load i8* %299, align 1
  %301 = zext i8 %300 to i32
  %302 = shl i32 %301, %293
  %303 = trunc i32 %302 to i8
  store i8 %303, i8* %299, align 1
  %304 = load i8* %third_shift_bits, align 1
  %305 = zext i8 %304 to i32
  %306 = load i32* %shift_size, align 4
  %307 = sub nsw i32 8, %306
  %308 = ashr i32 %305, %307
  %309 = load i32* %i, align 4
  %310 = sext i32 %309 to i64
  %311 = load %struct.key_set** %2, align 8
  %312 = getelementptr inbounds %struct.key_set* %311, i64 %310
  %313 = getelementptr inbounds %struct.key_set* %312, i32 0, i32 1
  %314 = getelementptr inbounds [4 x i8]* %313, i32 0, i64 1
  %315 = load i8* %314, align 1
  %316 = zext i8 %315 to i32
  %317 = or i32 %316, %308
  %318 = trunc i32 %317 to i8
  store i8 %318, i8* %314, align 1
  %319 = load i32* %shift_size, align 4
  %320 = load i32* %i, align 4
  %321 = sext i32 %320 to i64
  %322 = load %struct.key_set** %2, align 8
  %323 = getelementptr inbounds %struct.key_set* %322, i64 %321
  %324 = getelementptr inbounds %struct.key_set* %323, i32 0, i32 1
  %325 = getelementptr inbounds [4 x i8]* %324, i32 0, i64 2
  %326 = load i8* %325, align 1
  %327 = zext i8 %326 to i32
  %328 = shl i32 %327, %319
  %329 = trunc i32 %328 to i8
  store i8 %329, i8* %325, align 1
  %330 = load i8* %fourth_shift_bits, align 1
  %331 = zext i8 %330 to i32
  %332 = load i32* %shift_size, align 4
  %333 = sub nsw i32 8, %332
  %334 = ashr i32 %331, %333
  %335 = load i32* %i, align 4
  %336 = sext i32 %335 to i64
  %337 = load %struct.key_set** %2, align 8
  %338 = getelementptr inbounds %struct.key_set* %337, i64 %336
  %339 = getelementptr inbounds %struct.key_set* %338, i32 0, i32 1
  %340 = getelementptr inbounds [4 x i8]* %339, i32 0, i64 2
  %341 = load i8* %340, align 1
  %342 = zext i8 %341 to i32
  %343 = or i32 %342, %334
  %344 = trunc i32 %343 to i8
  store i8 %344, i8* %340, align 1
  %345 = load i32* %shift_size, align 4
  %346 = load i32* %i, align 4
  %347 = sext i32 %346 to i64
  %348 = load %struct.key_set** %2, align 8
  %349 = getelementptr inbounds %struct.key_set* %348, i64 %347
  %350 = getelementptr inbounds %struct.key_set* %349, i32 0, i32 1
  %351 = getelementptr inbounds [4 x i8]* %350, i32 0, i64 3
  %352 = load i8* %351, align 1
  %353 = zext i8 %352 to i32
  %354 = shl i32 %353, %345
  %355 = trunc i32 %354 to i8
  store i8 %355, i8* %351, align 1
  %356 = load i8* %first_shift_bits, align 1
  %357 = zext i8 %356 to i32
  %358 = load i32* %shift_size, align 4
  %359 = sub nsw i32 4, %358
  %360 = ashr i32 %357, %359
  %361 = load i32* %i, align 4
  %362 = sext i32 %361 to i64
  %363 = load %struct.key_set** %2, align 8
  %364 = getelementptr inbounds %struct.key_set* %363, i64 %362
  %365 = getelementptr inbounds %struct.key_set* %364, i32 0, i32 1
  %366 = getelementptr inbounds [4 x i8]* %365, i32 0, i64 3
  %367 = load i8* %366, align 1
  %368 = zext i8 %367 to i32
  %369 = or i32 %368, %360
  %370 = trunc i32 %369 to i8
  store i8 %370, i8* %366, align 1
  %371 = load i8* %shift_byte, align 1
  %372 = zext i8 %371 to i32
  %373 = load i32* %i, align 4
  %374 = sext i32 %373 to i64
  %375 = load %struct.key_set** %2, align 8
  %376 = getelementptr inbounds %struct.key_set* %375, i64 %374
  %377 = getelementptr inbounds %struct.key_set* %376, i32 0, i32 2
  %378 = getelementptr inbounds [4 x i8]* %377, i32 0, i64 0
  %379 = load i8* %378, align 1
  %380 = zext i8 %379 to i32
  %381 = and i32 %372, %380
  %382 = trunc i32 %381 to i8
  store i8 %382, i8* %first_shift_bits, align 1
  %383 = load i8* %shift_byte, align 1
  %384 = zext i8 %383 to i32
  %385 = load i32* %i, align 4
  %386 = sext i32 %385 to i64
  %387 = load %struct.key_set** %2, align 8
  %388 = getelementptr inbounds %struct.key_set* %387, i64 %386
  %389 = getelementptr inbounds %struct.key_set* %388, i32 0, i32 2
  %390 = getelementptr inbounds [4 x i8]* %389, i32 0, i64 1
  %391 = load i8* %390, align 1
  %392 = zext i8 %391 to i32
  %393 = and i32 %384, %392
  %394 = trunc i32 %393 to i8
  store i8 %394, i8* %second_shift_bits, align 1
  %395 = load i8* %shift_byte, align 1
  %396 = zext i8 %395 to i32
  %397 = load i32* %i, align 4
  %398 = sext i32 %397 to i64
  %399 = load %struct.key_set** %2, align 8
  %400 = getelementptr inbounds %struct.key_set* %399, i64 %398
  %401 = getelementptr inbounds %struct.key_set* %400, i32 0, i32 2
  %402 = getelementptr inbounds [4 x i8]* %401, i32 0, i64 2
  %403 = load i8* %402, align 1
  %404 = zext i8 %403 to i32
  %405 = and i32 %396, %404
  %406 = trunc i32 %405 to i8
  store i8 %406, i8* %third_shift_bits, align 1
  %407 = load i8* %shift_byte, align 1
  %408 = zext i8 %407 to i32
  %409 = load i32* %i, align 4
  %410 = sext i32 %409 to i64
  %411 = load %struct.key_set** %2, align 8
  %412 = getelementptr inbounds %struct.key_set* %411, i64 %410
  %413 = getelementptr inbounds %struct.key_set* %412, i32 0, i32 2
  %414 = getelementptr inbounds [4 x i8]* %413, i32 0, i64 3
  %415 = load i8* %414, align 1
  %416 = zext i8 %415 to i32
  %417 = and i32 %408, %416
  %418 = trunc i32 %417 to i8
  store i8 %418, i8* %fourth_shift_bits, align 1
  %419 = load i32* %shift_size, align 4
  %420 = load i32* %i, align 4
  %421 = sext i32 %420 to i64
  %422 = load %struct.key_set** %2, align 8
  %423 = getelementptr inbounds %struct.key_set* %422, i64 %421
  %424 = getelementptr inbounds %struct.key_set* %423, i32 0, i32 2
  %425 = getelementptr inbounds [4 x i8]* %424, i32 0, i64 0
  %426 = load i8* %425, align 1
  %427 = zext i8 %426 to i32
  %428 = shl i32 %427, %419
  %429 = trunc i32 %428 to i8
  store i8 %429, i8* %425, align 1
  %430 = load i8* %second_shift_bits, align 1
  %431 = zext i8 %430 to i32
  %432 = load i32* %shift_size, align 4
  %433 = sub nsw i32 8, %432
  %434 = ashr i32 %431, %433
  %435 = load i32* %i, align 4
  %436 = sext i32 %435 to i64
  %437 = load %struct.key_set** %2, align 8
  %438 = getelementptr inbounds %struct.key_set* %437, i64 %436
  %439 = getelementptr inbounds %struct.key_set* %438, i32 0, i32 2
  %440 = getelementptr inbounds [4 x i8]* %439, i32 0, i64 0
  %441 = load i8* %440, align 1
  %442 = zext i8 %441 to i32
  %443 = or i32 %442, %434
  %444 = trunc i32 %443 to i8
  store i8 %444, i8* %440, align 1
  %445 = load i32* %shift_size, align 4
  %446 = load i32* %i, align 4
  %447 = sext i32 %446 to i64
  %448 = load %struct.key_set** %2, align 8
  %449 = getelementptr inbounds %struct.key_set* %448, i64 %447
  %450 = getelementptr inbounds %struct.key_set* %449, i32 0, i32 2
  %451 = getelementptr inbounds [4 x i8]* %450, i32 0, i64 1
  %452 = load i8* %451, align 1
  %453 = zext i8 %452 to i32
  %454 = shl i32 %453, %445
  %455 = trunc i32 %454 to i8
  store i8 %455, i8* %451, align 1
  %456 = load i8* %third_shift_bits, align 1
  %457 = zext i8 %456 to i32
  %458 = load i32* %shift_size, align 4
  %459 = sub nsw i32 8, %458
  %460 = ashr i32 %457, %459
  %461 = load i32* %i, align 4
  %462 = sext i32 %461 to i64
  %463 = load %struct.key_set** %2, align 8
  %464 = getelementptr inbounds %struct.key_set* %463, i64 %462
  %465 = getelementptr inbounds %struct.key_set* %464, i32 0, i32 2
  %466 = getelementptr inbounds [4 x i8]* %465, i32 0, i64 1
  %467 = load i8* %466, align 1
  %468 = zext i8 %467 to i32
  %469 = or i32 %468, %460
  %470 = trunc i32 %469 to i8
  store i8 %470, i8* %466, align 1
  %471 = load i32* %shift_size, align 4
  %472 = load i32* %i, align 4
  %473 = sext i32 %472 to i64
  %474 = load %struct.key_set** %2, align 8
  %475 = getelementptr inbounds %struct.key_set* %474, i64 %473
  %476 = getelementptr inbounds %struct.key_set* %475, i32 0, i32 2
  %477 = getelementptr inbounds [4 x i8]* %476, i32 0, i64 2
  %478 = load i8* %477, align 1
  %479 = zext i8 %478 to i32
  %480 = shl i32 %479, %471
  %481 = trunc i32 %480 to i8
  store i8 %481, i8* %477, align 1
  %482 = load i8* %fourth_shift_bits, align 1
  %483 = zext i8 %482 to i32
  %484 = load i32* %shift_size, align 4
  %485 = sub nsw i32 8, %484
  %486 = ashr i32 %483, %485
  %487 = load i32* %i, align 4
  %488 = sext i32 %487 to i64
  %489 = load %struct.key_set** %2, align 8
  %490 = getelementptr inbounds %struct.key_set* %489, i64 %488
  %491 = getelementptr inbounds %struct.key_set* %490, i32 0, i32 2
  %492 = getelementptr inbounds [4 x i8]* %491, i32 0, i64 2
  %493 = load i8* %492, align 1
  %494 = zext i8 %493 to i32
  %495 = or i32 %494, %486
  %496 = trunc i32 %495 to i8
  store i8 %496, i8* %492, align 1
  %497 = load i32* %shift_size, align 4
  %498 = load i32* %i, align 4
  %499 = sext i32 %498 to i64
  %500 = load %struct.key_set** %2, align 8
  %501 = getelementptr inbounds %struct.key_set* %500, i64 %499
  %502 = getelementptr inbounds %struct.key_set* %501, i32 0, i32 2
  %503 = getelementptr inbounds [4 x i8]* %502, i32 0, i64 3
  %504 = load i8* %503, align 1
  %505 = zext i8 %504 to i32
  %506 = shl i32 %505, %497
  %507 = trunc i32 %506 to i8
  store i8 %507, i8* %503, align 1
  %508 = load i8* %first_shift_bits, align 1
  %509 = zext i8 %508 to i32
  %510 = load i32* %shift_size, align 4
  %511 = sub nsw i32 4, %510
  %512 = ashr i32 %509, %511
  %513 = load i32* %i, align 4
  %514 = sext i32 %513 to i64
  %515 = load %struct.key_set** %2, align 8
  %516 = getelementptr inbounds %struct.key_set* %515, i64 %514
  %517 = getelementptr inbounds %struct.key_set* %516, i32 0, i32 2
  %518 = getelementptr inbounds [4 x i8]* %517, i32 0, i64 3
  %519 = load i8* %518, align 1
  %520 = zext i8 %519 to i32
  %521 = or i32 %520, %512
  %522 = trunc i32 %521 to i8
  store i8 %522, i8* %518, align 1
  store i32 0, i32* %j, align 4
  br label %523

; <label>:523                                     ; preds = %610, %218
  %524 = load i32* %j, align 4
  %525 = icmp slt i32 %524, 48
  br i1 %525, label %526, label %613

; <label>:526                                     ; preds = %523
  %527 = load i32* %j, align 4
  %528 = sext i32 %527 to i64
  %529 = getelementptr inbounds [48 x i32]* @sub_key_permutation, i32 0, i64 %528
  %530 = load i32* %529, align 4
  store i32 %530, i32* %shift_size, align 4
  %531 = load i32* %shift_size, align 4
  %532 = icmp sle i32 %531, 28
  br i1 %532, label %533, label %562

; <label>:533                                     ; preds = %526
  %534 = load i32* %shift_size, align 4
  %535 = sub nsw i32 %534, 1
  %536 = srem i32 %535, 8
  %537 = ashr i32 128, %536
  %538 = trunc i32 %537 to i8
  store i8 %538, i8* %shift_byte, align 1
  %539 = load i32* %shift_size, align 4
  %540 = sub nsw i32 %539, 1
  %541 = sdiv i32 %540, 8
  %542 = sext i32 %541 to i64
  %543 = load i32* %i, align 4
  %544 = sext i32 %543 to i64
  %545 = load %struct.key_set** %2, align 8
  %546 = getelementptr inbounds %struct.key_set* %545, i64 %544
  %547 = getelementptr inbounds %struct.key_set* %546, i32 0, i32 1
  %548 = getelementptr inbounds [4 x i8]* %547, i32 0, i64 %542
  %549 = load i8* %548, align 1
  %550 = zext i8 %549 to i32
  %551 = load i8* %shift_byte, align 1
  %552 = zext i8 %551 to i32
  %553 = and i32 %552, %550
  %554 = trunc i32 %553 to i8
  store i8 %554, i8* %shift_byte, align 1
  %555 = load i32* %shift_size, align 4
  %556 = sub nsw i32 %555, 1
  %557 = srem i32 %556, 8
  %558 = load i8* %shift_byte, align 1
  %559 = zext i8 %558 to i32
  %560 = shl i32 %559, %557
  %561 = trunc i32 %560 to i8
  store i8 %561, i8* %shift_byte, align 1
  br label %591

; <label>:562                                     ; preds = %526
  %563 = load i32* %shift_size, align 4
  %564 = sub nsw i32 %563, 29
  %565 = srem i32 %564, 8
  %566 = ashr i32 128, %565
  %567 = trunc i32 %566 to i8
  store i8 %567, i8* %shift_byte, align 1
  %568 = load i32* %shift_size, align 4
  %569 = sub nsw i32 %568, 29
  %570 = sdiv i32 %569, 8
  %571 = sext i32 %570 to i64
  %572 = load i32* %i, align 4
  %573 = sext i32 %572 to i64
  %574 = load %struct.key_set** %2, align 8
  %575 = getelementptr inbounds %struct.key_set* %574, i64 %573
  %576 = getelementptr inbounds %struct.key_set* %575, i32 0, i32 2
  %577 = getelementptr inbounds [4 x i8]* %576, i32 0, i64 %571
  %578 = load i8* %577, align 1
  %579 = zext i8 %578 to i32
  %580 = load i8* %shift_byte, align 1
  %581 = zext i8 %580 to i32
  %582 = and i32 %581, %579
  %583 = trunc i32 %582 to i8
  store i8 %583, i8* %shift_byte, align 1
  %584 = load i32* %shift_size, align 4
  %585 = sub nsw i32 %584, 29
  %586 = srem i32 %585, 8
  %587 = load i8* %shift_byte, align 1
  %588 = zext i8 %587 to i32
  %589 = shl i32 %588, %586
  %590 = trunc i32 %589 to i8
  store i8 %590, i8* %shift_byte, align 1
  br label %591

; <label>:591                                     ; preds = %562, %533
  %592 = load i8* %shift_byte, align 1
  %593 = zext i8 %592 to i32
  %594 = load i32* %j, align 4
  %595 = srem i32 %594, 8
  %596 = ashr i32 %593, %595
  %597 = load i32* %j, align 4
  %598 = sdiv i32 %597, 8
  %599 = sext i32 %598 to i64
  %600 = load i32* %i, align 4
  %601 = sext i32 %600 to i64
  %602 = load %struct.key_set** %2, align 8
  %603 = getelementptr inbounds %struct.key_set* %602, i64 %601
  %604 = getelementptr inbounds %struct.key_set* %603, i32 0, i32 0
  %605 = getelementptr inbounds [8 x i8]* %604, i32 0, i64 %599
  %606 = load i8* %605, align 1
  %607 = zext i8 %606 to i32
  %608 = or i32 %607, %596
  %609 = trunc i32 %608 to i8
  store i8 %609, i8* %605, align 1
  br label %610

; <label>:610                                     ; preds = %591
  %611 = load i32* %j, align 4
  %612 = add nsw i32 %611, 1
  store i32 %612, i32* %j, align 4
  br label %523

; <label>:613                                     ; preds = %523
  br label %614

; <label>:614                                     ; preds = %613
  %615 = load i32* %i, align 4
  %616 = add nsw i32 %615, 1
  store i32 %616, i32* %i, align 4
  br label %162

; <label>:617                                     ; preds = %162
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

; <label>:7                                       ; preds = %52, %0
  %8 = load i32* %i, align 4
  %9 = icmp slt i32 %8, 64
  br i1 %9, label %10, label %55

; <label>:10                                      ; preds = %7
  %11 = load i32* %i, align 4
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds [64 x i32]* @initial_message_permutation, i32 0, i64 %12
  %14 = load i32* %13, align 4
  store i32 %14, i32* %shift_size, align 4
  %15 = load i32* %shift_size, align 4
  %16 = sub nsw i32 %15, 1
  %17 = srem i32 %16, 8
  %18 = ashr i32 128, %17
  %19 = trunc i32 %18 to i8
  store i8 %19, i8* %shift_byte, align 1
  %20 = load i32* %shift_size, align 4
  %21 = sub nsw i32 %20, 1
  %22 = sdiv i32 %21, 8
  %23 = sext i32 %22 to i64
  %24 = load i8** %1, align 8
  %25 = getelementptr inbounds i8* %24, i64 %23
  %26 = load i8* %25, align 1
  %27 = zext i8 %26 to i32
  %28 = load i8* %shift_byte, align 1
  %29 = zext i8 %28 to i32
  %30 = and i32 %29, %27
  %31 = trunc i32 %30 to i8
  store i8 %31, i8* %shift_byte, align 1
  %32 = load i32* %shift_size, align 4
  %33 = sub nsw i32 %32, 1
  %34 = srem i32 %33, 8
  %35 = load i8* %shift_byte, align 1
  %36 = zext i8 %35 to i32
  %37 = shl i32 %36, %34
  %38 = trunc i32 %37 to i8
  store i8 %38, i8* %shift_byte, align 1
  %39 = load i8* %shift_byte, align 1
  %40 = zext i8 %39 to i32
  %41 = load i32* %i, align 4
  %42 = srem i32 %41, 8
  %43 = ashr i32 %40, %42
  %44 = load i32* %i, align 4
  %45 = sdiv i32 %44, 8
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds [8 x i8]* %initial_permutation, i32 0, i64 %46
  %48 = load i8* %47, align 1
  %49 = zext i8 %48 to i32
  %50 = or i32 %49, %43
  %51 = trunc i32 %50 to i8
  store i8 %51, i8* %47, align 1
  br label %52

; <label>:52                                      ; preds = %10
  %53 = load i32* %i, align 4
  %54 = add nsw i32 %53, 1
  store i32 %54, i32* %i, align 4
  br label %7

; <label>:55                                      ; preds = %7
  store i32 0, i32* %i, align 4
  br label %56

; <label>:56                                      ; preds = %75, %55
  %57 = load i32* %i, align 4
  %58 = icmp slt i32 %57, 4
  br i1 %58, label %59, label %78

; <label>:59                                      ; preds = %56
  %60 = load i32* %i, align 4
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds [8 x i8]* %initial_permutation, i32 0, i64 %61
  %63 = load i8* %62, align 1
  %64 = load i32* %i, align 4
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds [4 x i8]* %l, i32 0, i64 %65
  store i8 %63, i8* %66, align 1
  %67 = load i32* %i, align 4
  %68 = add nsw i32 %67, 4
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds [8 x i8]* %initial_permutation, i32 0, i64 %69
  %71 = load i8* %70, align 1
  %72 = load i32* %i, align 4
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds [4 x i8]* %r, i32 0, i64 %73
  store i8 %71, i8* %74, align 1
  br label %75

; <label>:75                                      ; preds = %59
  %76 = load i32* %i, align 4
  %77 = add nsw i32 %76, 1
  store i32 %77, i32* %i, align 4
  br label %56

; <label>:78                                      ; preds = %56
  store i32 1, i32* %k, align 4
  br label %79

; <label>:79                                      ; preds = %659, %78
  %80 = load i32* %k, align 4
  %81 = icmp sle i32 %80, 16
  br i1 %81, label %82, label %662

; <label>:82                                      ; preds = %79
  %83 = bitcast [4 x i8]* %ln to i8*
  %84 = bitcast [4 x i8]* %r to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %83, i8* %84, i64 4, i32 1, i1 false)
  %85 = bitcast [6 x i8]* %er to i8*
  call void @llvm.memset.p0i8.i64(i8* %85, i8 0, i64 6, i32 1, i1 false)
  store i32 0, i32* %i, align 4
  br label %86

; <label>:86                                      ; preds = %130, %82
  %87 = load i32* %i, align 4
  %88 = icmp slt i32 %87, 48
  br i1 %88, label %89, label %133

; <label>:89                                      ; preds = %86
  %90 = load i32* %i, align 4
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds [48 x i32]* @message_expansion, i32 0, i64 %91
  %93 = load i32* %92, align 4
  store i32 %93, i32* %shift_size, align 4
  %94 = load i32* %shift_size, align 4
  %95 = sub nsw i32 %94, 1
  %96 = srem i32 %95, 8
  %97 = ashr i32 128, %96
  %98 = trunc i32 %97 to i8
  store i8 %98, i8* %shift_byte, align 1
  %99 = load i32* %shift_size, align 4
  %100 = sub nsw i32 %99, 1
  %101 = sdiv i32 %100, 8
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds [4 x i8]* %r, i32 0, i64 %102
  %104 = load i8* %103, align 1
  %105 = zext i8 %104 to i32
  %106 = load i8* %shift_byte, align 1
  %107 = zext i8 %106 to i32
  %108 = and i32 %107, %105
  %109 = trunc i32 %108 to i8
  store i8 %109, i8* %shift_byte, align 1
  %110 = load i32* %shift_size, align 4
  %111 = sub nsw i32 %110, 1
  %112 = srem i32 %111, 8
  %113 = load i8* %shift_byte, align 1
  %114 = zext i8 %113 to i32
  %115 = shl i32 %114, %112
  %116 = trunc i32 %115 to i8
  store i8 %116, i8* %shift_byte, align 1
  %117 = load i8* %shift_byte, align 1
  %118 = zext i8 %117 to i32
  %119 = load i32* %i, align 4
  %120 = srem i32 %119, 8
  %121 = ashr i32 %118, %120
  %122 = load i32* %i, align 4
  %123 = sdiv i32 %122, 8
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 %124
  %126 = load i8* %125, align 1
  %127 = zext i8 %126 to i32
  %128 = or i32 %127, %121
  %129 = trunc i32 %128 to i8
  store i8 %129, i8* %125, align 1
  br label %130

; <label>:130                                     ; preds = %89
  %131 = load i32* %i, align 4
  %132 = add nsw i32 %131, 1
  store i32 %132, i32* %i, align 4
  br label %86

; <label>:133                                     ; preds = %86
  %134 = load i32* %4, align 4
  %135 = icmp eq i32 %134, 0
  br i1 %135, label %136, label %139

; <label>:136                                     ; preds = %133
  %137 = load i32* %k, align 4
  %138 = sub nsw i32 17, %137
  store i32 %138, i32* %key_index, align 4
  br label %141

; <label>:139                                     ; preds = %133
  %140 = load i32* %k, align 4
  store i32 %140, i32* %key_index, align 4
  br label %141

; <label>:141                                     ; preds = %139, %136
  store i32 0, i32* %i, align 4
  br label %142

; <label>:142                                     ; preds = %163, %141
  %143 = load i32* %i, align 4
  %144 = icmp slt i32 %143, 6
  br i1 %144, label %145, label %166

; <label>:145                                     ; preds = %142
  %146 = load i32* %i, align 4
  %147 = sext i32 %146 to i64
  %148 = load i32* %key_index, align 4
  %149 = sext i32 %148 to i64
  %150 = load %struct.key_set** %3, align 8
  %151 = getelementptr inbounds %struct.key_set* %150, i64 %149
  %152 = getelementptr inbounds %struct.key_set* %151, i32 0, i32 0
  %153 = getelementptr inbounds [8 x i8]* %152, i32 0, i64 %147
  %154 = load i8* %153, align 1
  %155 = zext i8 %154 to i32
  %156 = load i32* %i, align 4
  %157 = sext i32 %156 to i64
  %158 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 %157
  %159 = load i8* %158, align 1
  %160 = zext i8 %159 to i32
  %161 = xor i32 %160, %155
  %162 = trunc i32 %161 to i8
  store i8 %162, i8* %158, align 1
  br label %163

; <label>:163                                     ; preds = %145
  %164 = load i32* %i, align 4
  %165 = add nsw i32 %164, 1
  store i32 %165, i32* %i, align 4
  br label %142

; <label>:166                                     ; preds = %142
  store i32 0, i32* %i, align 4
  br label %167

; <label>:167                                     ; preds = %174, %166
  %168 = load i32* %i, align 4
  %169 = icmp slt i32 %168, 4
  br i1 %169, label %170, label %177

; <label>:170                                     ; preds = %167
  %171 = load i32* %i, align 4
  %172 = sext i32 %171 to i64
  %173 = getelementptr inbounds [4 x i8]* %ser, i32 0, i64 %172
  store i8 0, i8* %173, align 1
  br label %174

; <label>:174                                     ; preds = %170
  %175 = load i32* %i, align 4
  %176 = add nsw i32 %175, 1
  store i32 %176, i32* %i, align 4
  br label %167

; <label>:177                                     ; preds = %167
  store i8 0, i8* %row, align 1
  %178 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 0
  %179 = load i8* %178, align 1
  %180 = zext i8 %179 to i32
  %181 = and i32 %180, 128
  %182 = ashr i32 %181, 6
  %183 = load i8* %row, align 1
  %184 = zext i8 %183 to i32
  %185 = or i32 %184, %182
  %186 = trunc i32 %185 to i8
  store i8 %186, i8* %row, align 1
  %187 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 0
  %188 = load i8* %187, align 1
  %189 = zext i8 %188 to i32
  %190 = and i32 %189, 4
  %191 = ashr i32 %190, 2
  %192 = load i8* %row, align 1
  %193 = zext i8 %192 to i32
  %194 = or i32 %193, %191
  %195 = trunc i32 %194 to i8
  store i8 %195, i8* %row, align 1
  store i8 0, i8* %column, align 1
  %196 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 0
  %197 = load i8* %196, align 1
  %198 = zext i8 %197 to i32
  %199 = and i32 %198, 120
  %200 = ashr i32 %199, 3
  %201 = load i8* %column, align 1
  %202 = zext i8 %201 to i32
  %203 = or i32 %202, %200
  %204 = trunc i32 %203 to i8
  store i8 %204, i8* %column, align 1
  %205 = load i8* %row, align 1
  %206 = zext i8 %205 to i32
  %207 = mul nsw i32 %206, 16
  %208 = load i8* %column, align 1
  %209 = zext i8 %208 to i32
  %210 = add nsw i32 %207, %209
  %211 = sext i32 %210 to i64
  %212 = getelementptr inbounds [64 x i32]* @S1, i32 0, i64 %211
  %213 = load i32* %212, align 4
  %214 = trunc i32 %213 to i8
  %215 = zext i8 %214 to i32
  %216 = shl i32 %215, 4
  %217 = getelementptr inbounds [4 x i8]* %ser, i32 0, i64 0
  %218 = load i8* %217, align 1
  %219 = zext i8 %218 to i32
  %220 = or i32 %219, %216
  %221 = trunc i32 %220 to i8
  store i8 %221, i8* %217, align 1
  store i8 0, i8* %row, align 1
  %222 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 0
  %223 = load i8* %222, align 1
  %224 = zext i8 %223 to i32
  %225 = and i32 %224, 2
  %226 = load i8* %row, align 1
  %227 = zext i8 %226 to i32
  %228 = or i32 %227, %225
  %229 = trunc i32 %228 to i8
  store i8 %229, i8* %row, align 1
  %230 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 1
  %231 = load i8* %230, align 1
  %232 = zext i8 %231 to i32
  %233 = and i32 %232, 16
  %234 = ashr i32 %233, 4
  %235 = load i8* %row, align 1
  %236 = zext i8 %235 to i32
  %237 = or i32 %236, %234
  %238 = trunc i32 %237 to i8
  store i8 %238, i8* %row, align 1
  store i8 0, i8* %column, align 1
  %239 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 0
  %240 = load i8* %239, align 1
  %241 = zext i8 %240 to i32
  %242 = and i32 %241, 1
  %243 = shl i32 %242, 3
  %244 = load i8* %column, align 1
  %245 = zext i8 %244 to i32
  %246 = or i32 %245, %243
  %247 = trunc i32 %246 to i8
  store i8 %247, i8* %column, align 1
  %248 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 1
  %249 = load i8* %248, align 1
  %250 = zext i8 %249 to i32
  %251 = and i32 %250, 224
  %252 = ashr i32 %251, 5
  %253 = load i8* %column, align 1
  %254 = zext i8 %253 to i32
  %255 = or i32 %254, %252
  %256 = trunc i32 %255 to i8
  store i8 %256, i8* %column, align 1
  %257 = load i8* %row, align 1
  %258 = zext i8 %257 to i32
  %259 = mul nsw i32 %258, 16
  %260 = load i8* %column, align 1
  %261 = zext i8 %260 to i32
  %262 = add nsw i32 %259, %261
  %263 = sext i32 %262 to i64
  %264 = getelementptr inbounds [64 x i32]* @S2, i32 0, i64 %263
  %265 = load i32* %264, align 4
  %266 = trunc i32 %265 to i8
  %267 = zext i8 %266 to i32
  %268 = getelementptr inbounds [4 x i8]* %ser, i32 0, i64 0
  %269 = load i8* %268, align 1
  %270 = zext i8 %269 to i32
  %271 = or i32 %270, %267
  %272 = trunc i32 %271 to i8
  store i8 %272, i8* %268, align 1
  store i8 0, i8* %row, align 1
  %273 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 1
  %274 = load i8* %273, align 1
  %275 = zext i8 %274 to i32
  %276 = and i32 %275, 8
  %277 = ashr i32 %276, 2
  %278 = load i8* %row, align 1
  %279 = zext i8 %278 to i32
  %280 = or i32 %279, %277
  %281 = trunc i32 %280 to i8
  store i8 %281, i8* %row, align 1
  %282 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 2
  %283 = load i8* %282, align 1
  %284 = zext i8 %283 to i32
  %285 = and i32 %284, 64
  %286 = ashr i32 %285, 6
  %287 = load i8* %row, align 1
  %288 = zext i8 %287 to i32
  %289 = or i32 %288, %286
  %290 = trunc i32 %289 to i8
  store i8 %290, i8* %row, align 1
  store i8 0, i8* %column, align 1
  %291 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 1
  %292 = load i8* %291, align 1
  %293 = zext i8 %292 to i32
  %294 = and i32 %293, 7
  %295 = shl i32 %294, 1
  %296 = load i8* %column, align 1
  %297 = zext i8 %296 to i32
  %298 = or i32 %297, %295
  %299 = trunc i32 %298 to i8
  store i8 %299, i8* %column, align 1
  %300 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 2
  %301 = load i8* %300, align 1
  %302 = zext i8 %301 to i32
  %303 = and i32 %302, 128
  %304 = ashr i32 %303, 7
  %305 = load i8* %column, align 1
  %306 = zext i8 %305 to i32
  %307 = or i32 %306, %304
  %308 = trunc i32 %307 to i8
  store i8 %308, i8* %column, align 1
  %309 = load i8* %row, align 1
  %310 = zext i8 %309 to i32
  %311 = mul nsw i32 %310, 16
  %312 = load i8* %column, align 1
  %313 = zext i8 %312 to i32
  %314 = add nsw i32 %311, %313
  %315 = sext i32 %314 to i64
  %316 = getelementptr inbounds [64 x i32]* @S3, i32 0, i64 %315
  %317 = load i32* %316, align 4
  %318 = trunc i32 %317 to i8
  %319 = zext i8 %318 to i32
  %320 = shl i32 %319, 4
  %321 = getelementptr inbounds [4 x i8]* %ser, i32 0, i64 1
  %322 = load i8* %321, align 1
  %323 = zext i8 %322 to i32
  %324 = or i32 %323, %320
  %325 = trunc i32 %324 to i8
  store i8 %325, i8* %321, align 1
  store i8 0, i8* %row, align 1
  %326 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 2
  %327 = load i8* %326, align 1
  %328 = zext i8 %327 to i32
  %329 = and i32 %328, 32
  %330 = ashr i32 %329, 4
  %331 = load i8* %row, align 1
  %332 = zext i8 %331 to i32
  %333 = or i32 %332, %330
  %334 = trunc i32 %333 to i8
  store i8 %334, i8* %row, align 1
  %335 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 2
  %336 = load i8* %335, align 1
  %337 = zext i8 %336 to i32
  %338 = and i32 %337, 1
  %339 = load i8* %row, align 1
  %340 = zext i8 %339 to i32
  %341 = or i32 %340, %338
  %342 = trunc i32 %341 to i8
  store i8 %342, i8* %row, align 1
  store i8 0, i8* %column, align 1
  %343 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 2
  %344 = load i8* %343, align 1
  %345 = zext i8 %344 to i32
  %346 = and i32 %345, 30
  %347 = ashr i32 %346, 1
  %348 = load i8* %column, align 1
  %349 = zext i8 %348 to i32
  %350 = or i32 %349, %347
  %351 = trunc i32 %350 to i8
  store i8 %351, i8* %column, align 1
  %352 = load i8* %row, align 1
  %353 = zext i8 %352 to i32
  %354 = mul nsw i32 %353, 16
  %355 = load i8* %column, align 1
  %356 = zext i8 %355 to i32
  %357 = add nsw i32 %354, %356
  %358 = sext i32 %357 to i64
  %359 = getelementptr inbounds [64 x i32]* @S4, i32 0, i64 %358
  %360 = load i32* %359, align 4
  %361 = trunc i32 %360 to i8
  %362 = zext i8 %361 to i32
  %363 = getelementptr inbounds [4 x i8]* %ser, i32 0, i64 1
  %364 = load i8* %363, align 1
  %365 = zext i8 %364 to i32
  %366 = or i32 %365, %362
  %367 = trunc i32 %366 to i8
  store i8 %367, i8* %363, align 1
  store i8 0, i8* %row, align 1
  %368 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 3
  %369 = load i8* %368, align 1
  %370 = zext i8 %369 to i32
  %371 = and i32 %370, 128
  %372 = ashr i32 %371, 6
  %373 = load i8* %row, align 1
  %374 = zext i8 %373 to i32
  %375 = or i32 %374, %372
  %376 = trunc i32 %375 to i8
  store i8 %376, i8* %row, align 1
  %377 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 3
  %378 = load i8* %377, align 1
  %379 = zext i8 %378 to i32
  %380 = and i32 %379, 4
  %381 = ashr i32 %380, 2
  %382 = load i8* %row, align 1
  %383 = zext i8 %382 to i32
  %384 = or i32 %383, %381
  %385 = trunc i32 %384 to i8
  store i8 %385, i8* %row, align 1
  store i8 0, i8* %column, align 1
  %386 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 3
  %387 = load i8* %386, align 1
  %388 = zext i8 %387 to i32
  %389 = and i32 %388, 120
  %390 = ashr i32 %389, 3
  %391 = load i8* %column, align 1
  %392 = zext i8 %391 to i32
  %393 = or i32 %392, %390
  %394 = trunc i32 %393 to i8
  store i8 %394, i8* %column, align 1
  %395 = load i8* %row, align 1
  %396 = zext i8 %395 to i32
  %397 = mul nsw i32 %396, 16
  %398 = load i8* %column, align 1
  %399 = zext i8 %398 to i32
  %400 = add nsw i32 %397, %399
  %401 = sext i32 %400 to i64
  %402 = getelementptr inbounds [64 x i32]* @S5, i32 0, i64 %401
  %403 = load i32* %402, align 4
  %404 = trunc i32 %403 to i8
  %405 = zext i8 %404 to i32
  %406 = shl i32 %405, 4
  %407 = getelementptr inbounds [4 x i8]* %ser, i32 0, i64 2
  %408 = load i8* %407, align 1
  %409 = zext i8 %408 to i32
  %410 = or i32 %409, %406
  %411 = trunc i32 %410 to i8
  store i8 %411, i8* %407, align 1
  store i8 0, i8* %row, align 1
  %412 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 3
  %413 = load i8* %412, align 1
  %414 = zext i8 %413 to i32
  %415 = and i32 %414, 2
  %416 = load i8* %row, align 1
  %417 = zext i8 %416 to i32
  %418 = or i32 %417, %415
  %419 = trunc i32 %418 to i8
  store i8 %419, i8* %row, align 1
  %420 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 4
  %421 = load i8* %420, align 1
  %422 = zext i8 %421 to i32
  %423 = and i32 %422, 16
  %424 = ashr i32 %423, 4
  %425 = load i8* %row, align 1
  %426 = zext i8 %425 to i32
  %427 = or i32 %426, %424
  %428 = trunc i32 %427 to i8
  store i8 %428, i8* %row, align 1
  store i8 0, i8* %column, align 1
  %429 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 3
  %430 = load i8* %429, align 1
  %431 = zext i8 %430 to i32
  %432 = and i32 %431, 1
  %433 = shl i32 %432, 3
  %434 = load i8* %column, align 1
  %435 = zext i8 %434 to i32
  %436 = or i32 %435, %433
  %437 = trunc i32 %436 to i8
  store i8 %437, i8* %column, align 1
  %438 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 4
  %439 = load i8* %438, align 1
  %440 = zext i8 %439 to i32
  %441 = and i32 %440, 224
  %442 = ashr i32 %441, 5
  %443 = load i8* %column, align 1
  %444 = zext i8 %443 to i32
  %445 = or i32 %444, %442
  %446 = trunc i32 %445 to i8
  store i8 %446, i8* %column, align 1
  %447 = load i8* %row, align 1
  %448 = zext i8 %447 to i32
  %449 = mul nsw i32 %448, 16
  %450 = load i8* %column, align 1
  %451 = zext i8 %450 to i32
  %452 = add nsw i32 %449, %451
  %453 = sext i32 %452 to i64
  %454 = getelementptr inbounds [64 x i32]* @S6, i32 0, i64 %453
  %455 = load i32* %454, align 4
  %456 = trunc i32 %455 to i8
  %457 = zext i8 %456 to i32
  %458 = getelementptr inbounds [4 x i8]* %ser, i32 0, i64 2
  %459 = load i8* %458, align 1
  %460 = zext i8 %459 to i32
  %461 = or i32 %460, %457
  %462 = trunc i32 %461 to i8
  store i8 %462, i8* %458, align 1
  store i8 0, i8* %row, align 1
  %463 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 4
  %464 = load i8* %463, align 1
  %465 = zext i8 %464 to i32
  %466 = and i32 %465, 8
  %467 = ashr i32 %466, 2
  %468 = load i8* %row, align 1
  %469 = zext i8 %468 to i32
  %470 = or i32 %469, %467
  %471 = trunc i32 %470 to i8
  store i8 %471, i8* %row, align 1
  %472 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 5
  %473 = load i8* %472, align 1
  %474 = zext i8 %473 to i32
  %475 = and i32 %474, 64
  %476 = ashr i32 %475, 6
  %477 = load i8* %row, align 1
  %478 = zext i8 %477 to i32
  %479 = or i32 %478, %476
  %480 = trunc i32 %479 to i8
  store i8 %480, i8* %row, align 1
  store i8 0, i8* %column, align 1
  %481 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 4
  %482 = load i8* %481, align 1
  %483 = zext i8 %482 to i32
  %484 = and i32 %483, 7
  %485 = shl i32 %484, 1
  %486 = load i8* %column, align 1
  %487 = zext i8 %486 to i32
  %488 = or i32 %487, %485
  %489 = trunc i32 %488 to i8
  store i8 %489, i8* %column, align 1
  %490 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 5
  %491 = load i8* %490, align 1
  %492 = zext i8 %491 to i32
  %493 = and i32 %492, 128
  %494 = ashr i32 %493, 7
  %495 = load i8* %column, align 1
  %496 = zext i8 %495 to i32
  %497 = or i32 %496, %494
  %498 = trunc i32 %497 to i8
  store i8 %498, i8* %column, align 1
  %499 = load i8* %row, align 1
  %500 = zext i8 %499 to i32
  %501 = mul nsw i32 %500, 16
  %502 = load i8* %column, align 1
  %503 = zext i8 %502 to i32
  %504 = add nsw i32 %501, %503
  %505 = sext i32 %504 to i64
  %506 = getelementptr inbounds [64 x i32]* @S7, i32 0, i64 %505
  %507 = load i32* %506, align 4
  %508 = trunc i32 %507 to i8
  %509 = zext i8 %508 to i32
  %510 = shl i32 %509, 4
  %511 = getelementptr inbounds [4 x i8]* %ser, i32 0, i64 3
  %512 = load i8* %511, align 1
  %513 = zext i8 %512 to i32
  %514 = or i32 %513, %510
  %515 = trunc i32 %514 to i8
  store i8 %515, i8* %511, align 1
  store i8 0, i8* %row, align 1
  %516 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 5
  %517 = load i8* %516, align 1
  %518 = zext i8 %517 to i32
  %519 = and i32 %518, 32
  %520 = ashr i32 %519, 4
  %521 = load i8* %row, align 1
  %522 = zext i8 %521 to i32
  %523 = or i32 %522, %520
  %524 = trunc i32 %523 to i8
  store i8 %524, i8* %row, align 1
  %525 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 5
  %526 = load i8* %525, align 1
  %527 = zext i8 %526 to i32
  %528 = and i32 %527, 1
  %529 = load i8* %row, align 1
  %530 = zext i8 %529 to i32
  %531 = or i32 %530, %528
  %532 = trunc i32 %531 to i8
  store i8 %532, i8* %row, align 1
  store i8 0, i8* %column, align 1
  %533 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 5
  %534 = load i8* %533, align 1
  %535 = zext i8 %534 to i32
  %536 = and i32 %535, 30
  %537 = ashr i32 %536, 1
  %538 = load i8* %column, align 1
  %539 = zext i8 %538 to i32
  %540 = or i32 %539, %537
  %541 = trunc i32 %540 to i8
  store i8 %541, i8* %column, align 1
  %542 = load i8* %row, align 1
  %543 = zext i8 %542 to i32
  %544 = mul nsw i32 %543, 16
  %545 = load i8* %column, align 1
  %546 = zext i8 %545 to i32
  %547 = add nsw i32 %544, %546
  %548 = sext i32 %547 to i64
  %549 = getelementptr inbounds [64 x i32]* @S8, i32 0, i64 %548
  %550 = load i32* %549, align 4
  %551 = trunc i32 %550 to i8
  %552 = zext i8 %551 to i32
  %553 = getelementptr inbounds [4 x i8]* %ser, i32 0, i64 3
  %554 = load i8* %553, align 1
  %555 = zext i8 %554 to i32
  %556 = or i32 %555, %552
  %557 = trunc i32 %556 to i8
  store i8 %557, i8* %553, align 1
  store i32 0, i32* %i, align 4
  br label %558

; <label>:558                                     ; preds = %565, %177
  %559 = load i32* %i, align 4
  %560 = icmp slt i32 %559, 4
  br i1 %560, label %561, label %568

; <label>:561                                     ; preds = %558
  %562 = load i32* %i, align 4
  %563 = sext i32 %562 to i64
  %564 = getelementptr inbounds [4 x i8]* %rn, i32 0, i64 %563
  store i8 0, i8* %564, align 1
  br label %565

; <label>:565                                     ; preds = %561
  %566 = load i32* %i, align 4
  %567 = add nsw i32 %566, 1
  store i32 %567, i32* %i, align 4
  br label %558

; <label>:568                                     ; preds = %558
  store i32 0, i32* %i, align 4
  br label %569

; <label>:569                                     ; preds = %613, %568
  %570 = load i32* %i, align 4
  %571 = icmp slt i32 %570, 32
  br i1 %571, label %572, label %616

; <label>:572                                     ; preds = %569
  %573 = load i32* %i, align 4
  %574 = sext i32 %573 to i64
  %575 = getelementptr inbounds [32 x i32]* @right_sub_message_permutation, i32 0, i64 %574
  %576 = load i32* %575, align 4
  store i32 %576, i32* %shift_size, align 4
  %577 = load i32* %shift_size, align 4
  %578 = sub nsw i32 %577, 1
  %579 = srem i32 %578, 8
  %580 = ashr i32 128, %579
  %581 = trunc i32 %580 to i8
  store i8 %581, i8* %shift_byte, align 1
  %582 = load i32* %shift_size, align 4
  %583 = sub nsw i32 %582, 1
  %584 = sdiv i32 %583, 8
  %585 = sext i32 %584 to i64
  %586 = getelementptr inbounds [4 x i8]* %ser, i32 0, i64 %585
  %587 = load i8* %586, align 1
  %588 = zext i8 %587 to i32
  %589 = load i8* %shift_byte, align 1
  %590 = zext i8 %589 to i32
  %591 = and i32 %590, %588
  %592 = trunc i32 %591 to i8
  store i8 %592, i8* %shift_byte, align 1
  %593 = load i32* %shift_size, align 4
  %594 = sub nsw i32 %593, 1
  %595 = srem i32 %594, 8
  %596 = load i8* %shift_byte, align 1
  %597 = zext i8 %596 to i32
  %598 = shl i32 %597, %595
  %599 = trunc i32 %598 to i8
  store i8 %599, i8* %shift_byte, align 1
  %600 = load i8* %shift_byte, align 1
  %601 = zext i8 %600 to i32
  %602 = load i32* %i, align 4
  %603 = srem i32 %602, 8
  %604 = ashr i32 %601, %603
  %605 = load i32* %i, align 4
  %606 = sdiv i32 %605, 8
  %607 = sext i32 %606 to i64
  %608 = getelementptr inbounds [4 x i8]* %rn, i32 0, i64 %607
  %609 = load i8* %608, align 1
  %610 = zext i8 %609 to i32
  %611 = or i32 %610, %604
  %612 = trunc i32 %611 to i8
  store i8 %612, i8* %608, align 1
  br label %613

; <label>:613                                     ; preds = %572
  %614 = load i32* %i, align 4
  %615 = add nsw i32 %614, 1
  store i32 %615, i32* %i, align 4
  br label %569

; <label>:616                                     ; preds = %569
  store i32 0, i32* %i, align 4
  br label %617

; <label>:617                                     ; preds = %633, %616
  %618 = load i32* %i, align 4
  %619 = icmp slt i32 %618, 4
  br i1 %619, label %620, label %636

; <label>:620                                     ; preds = %617
  %621 = load i32* %i, align 4
  %622 = sext i32 %621 to i64
  %623 = getelementptr inbounds [4 x i8]* %l, i32 0, i64 %622
  %624 = load i8* %623, align 1
  %625 = zext i8 %624 to i32
  %626 = load i32* %i, align 4
  %627 = sext i32 %626 to i64
  %628 = getelementptr inbounds [4 x i8]* %rn, i32 0, i64 %627
  %629 = load i8* %628, align 1
  %630 = zext i8 %629 to i32
  %631 = xor i32 %630, %625
  %632 = trunc i32 %631 to i8
  store i8 %632, i8* %628, align 1
  br label %633

; <label>:633                                     ; preds = %620
  %634 = load i32* %i, align 4
  %635 = add nsw i32 %634, 1
  store i32 %635, i32* %i, align 4
  br label %617

; <label>:636                                     ; preds = %617
  store i32 0, i32* %i, align 4
  br label %637

; <label>:637                                     ; preds = %655, %636
  %638 = load i32* %i, align 4
  %639 = icmp slt i32 %638, 4
  br i1 %639, label %640, label %658

; <label>:640                                     ; preds = %637
  %641 = load i32* %i, align 4
  %642 = sext i32 %641 to i64
  %643 = getelementptr inbounds [4 x i8]* %ln, i32 0, i64 %642
  %644 = load i8* %643, align 1
  %645 = load i32* %i, align 4
  %646 = sext i32 %645 to i64
  %647 = getelementptr inbounds [4 x i8]* %l, i32 0, i64 %646
  store i8 %644, i8* %647, align 1
  %648 = load i32* %i, align 4
  %649 = sext i32 %648 to i64
  %650 = getelementptr inbounds [4 x i8]* %rn, i32 0, i64 %649
  %651 = load i8* %650, align 1
  %652 = load i32* %i, align 4
  %653 = sext i32 %652 to i64
  %654 = getelementptr inbounds [4 x i8]* %r, i32 0, i64 %653
  store i8 %651, i8* %654, align 1
  br label %655

; <label>:655                                     ; preds = %640
  %656 = load i32* %i, align 4
  %657 = add nsw i32 %656, 1
  store i32 %657, i32* %i, align 4
  br label %637

; <label>:658                                     ; preds = %637
  br label %659

; <label>:659                                     ; preds = %658
  %660 = load i32* %k, align 4
  %661 = add nsw i32 %660, 1
  store i32 %661, i32* %k, align 4
  br label %79

; <label>:662                                     ; preds = %79
  store i32 0, i32* %i, align 4
  br label %663

; <label>:663                                     ; preds = %682, %662
  %664 = load i32* %i, align 4
  %665 = icmp slt i32 %664, 4
  br i1 %665, label %666, label %685

; <label>:666                                     ; preds = %663
  %667 = load i32* %i, align 4
  %668 = sext i32 %667 to i64
  %669 = getelementptr inbounds [4 x i8]* %r, i32 0, i64 %668
  %670 = load i8* %669, align 1
  %671 = load i32* %i, align 4
  %672 = sext i32 %671 to i64
  %673 = getelementptr inbounds [8 x i8]* %pre_end_permutation, i32 0, i64 %672
  store i8 %670, i8* %673, align 1
  %674 = load i32* %i, align 4
  %675 = sext i32 %674 to i64
  %676 = getelementptr inbounds [4 x i8]* %l, i32 0, i64 %675
  %677 = load i8* %676, align 1
  %678 = load i32* %i, align 4
  %679 = add nsw i32 4, %678
  %680 = sext i32 %679 to i64
  %681 = getelementptr inbounds [8 x i8]* %pre_end_permutation, i32 0, i64 %680
  store i8 %677, i8* %681, align 1
  br label %682

; <label>:682                                     ; preds = %666
  %683 = load i32* %i, align 4
  %684 = add nsw i32 %683, 1
  store i32 %684, i32* %i, align 4
  br label %663

; <label>:685                                     ; preds = %663
  store i32 0, i32* %i, align 4
  br label %686

; <label>:686                                     ; preds = %731, %685
  %687 = load i32* %i, align 4
  %688 = icmp slt i32 %687, 64
  br i1 %688, label %689, label %734

; <label>:689                                     ; preds = %686
  %690 = load i32* %i, align 4
  %691 = sext i32 %690 to i64
  %692 = getelementptr inbounds [64 x i32]* @final_message_permutation, i32 0, i64 %691
  %693 = load i32* %692, align 4
  store i32 %693, i32* %shift_size, align 4
  %694 = load i32* %shift_size, align 4
  %695 = sub nsw i32 %694, 1
  %696 = srem i32 %695, 8
  %697 = ashr i32 128, %696
  %698 = trunc i32 %697 to i8
  store i8 %698, i8* %shift_byte, align 1
  %699 = load i32* %shift_size, align 4
  %700 = sub nsw i32 %699, 1
  %701 = sdiv i32 %700, 8
  %702 = sext i32 %701 to i64
  %703 = getelementptr inbounds [8 x i8]* %pre_end_permutation, i32 0, i64 %702
  %704 = load i8* %703, align 1
  %705 = zext i8 %704 to i32
  %706 = load i8* %shift_byte, align 1
  %707 = zext i8 %706 to i32
  %708 = and i32 %707, %705
  %709 = trunc i32 %708 to i8
  store i8 %709, i8* %shift_byte, align 1
  %710 = load i32* %shift_size, align 4
  %711 = sub nsw i32 %710, 1
  %712 = srem i32 %711, 8
  %713 = load i8* %shift_byte, align 1
  %714 = zext i8 %713 to i32
  %715 = shl i32 %714, %712
  %716 = trunc i32 %715 to i8
  store i8 %716, i8* %shift_byte, align 1
  %717 = load i8* %shift_byte, align 1
  %718 = zext i8 %717 to i32
  %719 = load i32* %i, align 4
  %720 = srem i32 %719, 8
  %721 = ashr i32 %718, %720
  %722 = load i32* %i, align 4
  %723 = sdiv i32 %722, 8
  %724 = sext i32 %723 to i64
  %725 = load i8** %2, align 8
  %726 = getelementptr inbounds i8* %725, i64 %724
  %727 = load i8* %726, align 1
  %728 = zext i8 %727 to i32
  %729 = or i32 %728, %721
  %730 = trunc i32 %729 to i8
  store i8 %730, i8* %726, align 1
  br label %731

; <label>:731                                     ; preds = %689
  %732 = load i32* %i, align 4
  %733 = add nsw i32 %732, 1
  store i32 %733, i32* %i, align 4
  br label %686

; <label>:734                                     ; preds = %686
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
