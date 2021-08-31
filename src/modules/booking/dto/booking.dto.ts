import {
  IsInt,
  IsNotEmpty,
  IsPositive,
  Max,
  Validate,
} from 'class-validator';
import { IsBeforeConstraint } from '../../../common/constraints/isbefore.constraint';
import { IsLowerMonthConstraint } from '../../../common/constraints/isLowerMonth.constraint';
import { IsWeekend } from '../../../common/constraints/isWeekend';
import { ApiProperty } from '@nestjs/swagger';

export class BookingDto {
  @ApiProperty({
    description: 'Date when rent will be start',
    example: '2021-08-16'
  })
  @IsNotEmpty()
  @Validate(IsBeforeConstraint, ['endDate'])
  @Validate(IsLowerMonthConstraint, ['endDate'])
  @Validate(IsWeekend)
  startDate: string;

  @ApiProperty({
    description: 'Date when rent will be end',
    example: "2021-08-17"
  })
  @IsNotEmpty()
  @Validate(IsWeekend)
  endDate: string;

  @ApiProperty({
    description: 'Rate id from db',
    example: 1
  })
  @IsPositive()
  @IsInt()
  @IsNotEmpty()
  @Max(3)
  rateId: number;

  @ApiProperty({
    description: 'Auto id from db',
    example: 1
  })
  @IsPositive()
  @IsInt()
  @IsNotEmpty()
  @Max(5)
  autoId: number;
}
